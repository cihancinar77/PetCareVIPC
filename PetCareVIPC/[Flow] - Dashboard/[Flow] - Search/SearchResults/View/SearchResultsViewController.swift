//
//  SearchResultsViewController.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 24.07.2023.
//

import UIKit

protocol SearchResultsViewControllerProtocol: AnyObject {
	func display(viewState: SearchResultsViewState)
}

final class SearchResultsViewController: UIViewController {

    private var collectionViewModel: [String] = []
    private var tableViewData: [SearchResultsTableViewModel] = []
    private let pickerViewData = ["Sort by name A-Z", "Sort by name Z-A", "Sort by distance (low-high)", "Sort by cost (low-high)"]
	private let interactor: SearchResultsInteractorProtocol

	init(interactor: SearchResultsInteractorProtocol) {
		self.interactor = interactor
		super.init(nibName: nil, bundle: nil)
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private let customView = SearchResultsView()

	override func loadView() {
		view = customView
	}

	override func viewDidLoad() {
		super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil) // TODO: DOES NOT WORK
        let filterImage = UIImage(systemName: "slider.vertical.3")?.withTintColor(Colors.violet!, renderingMode: .alwaysOriginal)
        let filterButton = UIButton(type: .system)
        filterButton.setImage(filterImage, for: .normal)
        filterButton.setTitle("Filter", for: .normal)
        filterButton.setTitleColor(Colors.violet, for: .normal)
        filterButton.sizeToFit()
        filterButton.addTarget(self, action: #selector(didTapFilterButton), for: .touchUpInside)
        let filterBarButtonItem = UIBarButtonItem(customView: filterButton)
        navigationItem.rightBarButtonItem = filterBarButtonItem
        
        
        navigationItem.titleView = customView.segmentedControl
        customView.segmentedControl.addTarget(self, action: #selector(didSegmentValueChanged), for: .valueChanged)
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
        customView.collectionView.delegate = self
        customView.collectionView.dataSource = self
		interactor.viewDidLoad()
	}
    
    @objc func didSegmentValueChanged() {
        interactor.didSegmentValueChanged(value: customView.segmentedControl.selectedSegmentIndex)
    }
    
    @objc func didTapFilterButton() {
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: UIScreen.main.bounds.width - 10, height: 200.0)
        
        let picker = UIPickerView(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width - 10, height: 200.0))
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.delegate = self
        picker.dataSource = self
        vc.view.addSubview(picker)
        
        NSLayoutConstraint.activate([
            picker.leadingAnchor.constraint(equalTo: vc.view.leadingAnchor, constant: 16),
            picker.trailingAnchor.constraint(equalTo: vc.view.trailingAnchor, constant: -16)
        ])
        
        let pickerSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        pickerSheet.setValue(vc, forKey: "contentViewController")
        pickerSheet.title = "Filter"
        pickerSheet.addAction(UIAlertAction(title: "Done", style: .cancel, handler: { action in
            let selectedFilterIndex = picker.selectedRow(inComponent: 0)
            self.interactor.didSelectFilter(selectedFilterIndex: selectedFilterIndex)
        }))
        present(pickerSheet, animated: true, completion: nil)
    }
}

// MARK: - SearchResultsViewControllerProtocol
extension SearchResultsViewController: SearchResultsViewControllerProtocol {

	func display(viewState: SearchResultsViewState) {
        switch viewState {
        case .initial(let listingState, let tableViewData, let collectionViewModel):
            switch listingState {
            case .specialist:
                customView.segmentedControl.selectedSegmentIndex = 0
            case .clinics:
                customView.segmentedControl.selectedSegmentIndex = 1
            }
            self.collectionViewModel = collectionViewModel
            customView.collectionView.reloadData()
            self.tableViewData = tableViewData
            customView.tableView.reloadData()
        }
	}
}

// MARK: - UITableViewDelegate & UITableViewDataSource
extension SearchResultsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultsTableViewCell", for: indexPath) as! SearchResultsTableViewCell
        cell.reloadWith(viewModel: tableViewData[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegate & UICollectionViewDataSource
extension SearchResultsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchFilterCollectionViewCell", for: indexPath) as! SearchFilterCollectionViewCell
        cell.reloadWith(text: collectionViewModel[indexPath.row])
        return cell
    }
}

// MARK: - UIPickerViewDelegate & UIPickerViewDataSource
extension SearchResultsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerViewData[row]
    }
    
}
