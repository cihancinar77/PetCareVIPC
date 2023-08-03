//
//  TutorialsInteractor.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 4.07.2023.
//

import Foundation

protocol TutorialsInteractorProtocol: AnyObject {
	func viewDidLoad()
    func didTapNextButton()
	func collectionViewDidEndDisplaying(_ index: Int)
}

protocol TutorialsInteractorCoordinatorDelegate: AnyObject {
    func didTutorialsFinish()
}

final class TutorialsInteractor {

	weak var coordinator: TutorialsInteractorCoordinatorDelegate?
	private let presenter: TutorialsPresenterProtocol
	private var collectionData: [TutorialsViewModel] = []
	private var currentIndex: Int = 0

	init(presenter: TutorialsPresenterProtocol) {
		self.presenter = presenter
	}
}

// MARK: - TutorialsInteractorProtocol
extension TutorialsInteractor: TutorialsInteractorProtocol {
    
    func viewDidLoad() {
        do {
            if let bundlePath = Bundle.main.path(forResource: "tutorials", ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8)
            {
                let result = try JSONDecoder().decode([TutorialsViewModel].self, from: jsonData)
				self.collectionData = result
				self.currentIndex = 0
                presenter.setupInitialState(data: result)
            }
        } catch {
            print(error)
        }
    }
	
	func collectionViewDidEndDisplaying(_ index: Int) {
		currentIndex = index
		presenter.updateScreen(data: collectionData[index], isLastItem: currentIndex == collectionData.count - 1, pageIndex: currentIndex)
	}
    
    func didTapNextButton() {
		
		if currentIndex < collectionData.count - 1 {
			currentIndex += 1
			presenter.updateScreen(data: collectionData[currentIndex], isLastItem: currentIndex == collectionData.count - 1, pageIndex: currentIndex)
		} else {
			UserDefaults.standard.set(true, forKey: "isTutorialsFinished")
			coordinator?.didTutorialsFinish()
		}
    }
}
