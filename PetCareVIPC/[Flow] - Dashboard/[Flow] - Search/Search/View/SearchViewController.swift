//
//  SearchViewController.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 10.07.2023.
//

import UIKit

protocol SearchViewControllerProtocol: AnyObject {
	func display(viewState: SearchViewState)
}

final class SearchViewController: UIViewController {

    private var collectionViewData: [SearchCollectionViewModel] = []
	private let interactor: SearchInteractorProtocol

	init(interactor: SearchInteractorProtocol) {
		self.interactor = interactor
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private let customView = SearchView()

	override func loadView() {
		view = customView
	}

	override func viewDidLoad() {
		super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "navigationSearchButton")?.withRenderingMode(.alwaysOriginal),
            style:.plain,
            target: self,
            action: #selector(didTapSeachButton))
       
        customView.searchCollectionView.delegate = self
        customView.searchCollectionView.dataSource = self
		interactor.viewDidLoad()
	}
    
    @objc private func didTapSeachButton() {
        interactor.didTapSeachButton(selectionId: "00")
    }
}

// MARK: - SearchViewControllerProtocol
extension SearchViewController: SearchViewControllerProtocol {

	func display(viewState: SearchViewState) {
        switch viewState {
        case .initial(let attributedHeadlineString, let viewModel):
            customView.headlineLabel.attributedText = attributedHeadlineString
            self.collectionViewData = viewModel
            customView.searchCollectionView.reloadData()
        }
	}
}

// MARK: - UICollectionViewDelegate&UICollectionViewDataSource
extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCell", for: indexPath) as! SearchCollectionViewCell
        cell.reloadWith(data: collectionViewData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCellIndex = indexPath.row
        interactor.didSelectCell(selectedCell: selectedCellIndex)
    }
}
