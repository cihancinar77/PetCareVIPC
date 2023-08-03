//
//  TutorialsViewController.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 4.07.2023.
//

import UIKit

protocol TutorialsViewControllerProtocol: AnyObject {
	func display(viewState: TutorialsViewState)
	func updateScreen(title: String, subtitle: String, buttonText: String, pageIndex: Int)
}

final class TutorialsViewController: UIViewController {

	private let interactor: TutorialsInteractorProtocol
    private var tutorialsViewData: [TutorialsViewModel] = []
	
	init(interactor: TutorialsInteractorProtocol) {
		self.interactor = interactor
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private let customView = TutorialsView()

	override func loadView() {
		view = customView
	}

	override func viewDidLoad() {
		super.viewDidLoad()
        customView.tutorialsCollectionView.delegate = self
        customView.tutorialsCollectionView.dataSource = self
        customView.nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
		interactor.viewDidLoad()
	}
    
    @objc func didTapNextButton() {
        interactor.didTapNextButton()
    }
}

// MARK: - TutorialsViewControllerProtocol
extension TutorialsViewController: TutorialsViewControllerProtocol {

	func display(viewState: TutorialsViewState) {
        switch viewState {
        case .initial(let data):
            self.tutorialsViewData = data
			customView.pageControl.numberOfPages = data.count
            customView.tutorialsCollectionView.reloadData()
			interactor.collectionViewDidEndDisplaying(0)
        }
	}
	
	func updateScreen(title: String, subtitle: String, buttonText: String, pageIndex: Int) {
		
		if customView.pageControl.currentPage != pageIndex {
			customView.tutorialsCollectionView.isPagingEnabled = false
			customView.tutorialsCollectionView.scrollToItem(at: .init(row: pageIndex, section: 0), at: .centeredHorizontally, animated: true)
			customView.tutorialsCollectionView.isPagingEnabled = true
		}
		
		customView.pageControl.currentPage = pageIndex
		customView.headlineLabel.text = title
		customView.bodyLabel.text = subtitle
		customView.nextButton.setTitle(buttonText, for: .normal)
	}
}

extension TutorialsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tutorialsViewData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TutorialsCell", for: indexPath) as! TutorialsCollectionViewCell
        cell.reloadWith(image: tutorialsViewData[indexPath.row].image)
        return cell
    }
	
	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
		let index = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
		interactor.collectionViewDidEndDisplaying(index)
	}
}
