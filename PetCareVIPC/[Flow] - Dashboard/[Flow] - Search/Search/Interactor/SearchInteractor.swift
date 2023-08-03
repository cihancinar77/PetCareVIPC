//
//  SearchInteractor.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 10.07.2023.
//

import Foundation

protocol SearchInteractorProtocol: AnyObject {
	func viewDidLoad()
    func didSelectCell(selectedCell: Int)
    func didTapSeachButton(selectionId: String)
}

protocol SearchInteractorCoordinatorDelegate: AnyObject {
    func userDidSelectSearchItem()
}

final class SearchInteractor {

    private var userData: User?
    private var collectionData: [SearchCollectionViewModel] = []
	weak var coordinator: SearchInteractorCoordinatorDelegate?
	private let presenter: SearchPresenterProtocol
	private let searchService: SearchServiceProtocol

	init(
		presenter: SearchPresenterProtocol,
		searchService: SearchServiceProtocol
	) {
		self.presenter = presenter
		self.searchService = searchService
	}
    
    private func getUserData(completion: @escaping (User) -> Void) {
        if let savedPerson = UserDefaults.standard.object(forKey: "loggedInUser") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(User.self, from: savedPerson) {
                completion(loadedPerson)
            }
        }
    }
    
    private func fetchViewModel(completion: @escaping ([SearchCollectionViewModel]) -> Void) {
        do {
            if let bundlePath = Bundle.main.path(forResource: "searchCollectionData", ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8)
            {
                let result = try JSONDecoder().decode([SearchCollectionViewModel].self, from: jsonData)
                completion(result)
            }
        } catch {
            print(error)
        }
    }
}

// MARK: - SearchInteractorProtocol
extension SearchInteractor: SearchInteractorProtocol {

	func viewDidLoad() {
        getUserData { user in
            self.userData = user
        }
        fetchViewModel { viewModel in
            self.collectionData = viewModel
        }
        guard let userData = self.userData else { return }
        presenter.setupInitialState(userData: userData, collectionData: collectionData)
	}
    
    func didSelectCell(selectedCell: Int) {
        let selectionId = collectionData[selectedCell].id
    }
    
    func didTapSeachButton(selectionId: String) {
        coordinator?.userDidSelectSearchItem()
    }
}
