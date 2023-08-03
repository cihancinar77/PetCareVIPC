//
//  SearchListingViewController.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 22.07.2023.
//

import UIKit

protocol SearchListingViewControllerProtocol: AnyObject {
	func display(viewState: SearchListingViewState)
}

final class SearchListingViewController: UIViewController {

    private var tableViewData: [[String]] = []
	private let interactor: SearchListingInteractorProtocol

	init(interactor: SearchListingInteractorProtocol) {
		self.interactor = interactor
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private let customView = SearchListingView()

	override func loadView() {
		view = customView
	}

	override func viewDidLoad() {
		super.viewDidLoad()
        self.title = "Select a speciality"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "closeIcon")?.withRenderingMode(.alwaysOriginal),
            style:.plain,
            target: self,
            action: #selector(didTapCloseButton))
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
		interactor.viewDidLoad()
	}
    
    @objc func didTapCloseButton() {
        interactor.didTapCloseButton()
       }
}

// MARK: - SearchListingViewControllerProtocol
extension SearchListingViewController: SearchListingViewControllerProtocol {

	func display(viewState: SearchListingViewState) {
        switch viewState {
        case .initial(let tableViewData):
            self.tableViewData = tableViewData
            customView.tableView.reloadData()
        }
	}
}

// MARK: - UITableViewDelegate & UITableViewDataSource
extension SearchListingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UITableViewHeaderFooterView()
        headerView.textLabel?.textColor = Colors.orange
        headerView.textLabel?.font = UIFont(name: Fonts.EncodeSans.bold, size: 10)
        return headerView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
       }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return tableViewData[0].count
        case 1:
            return tableViewData[1].count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchListingTableViewCell", for: indexPath) as! SearchListingTableViewCell
        cell.reloadWith(text: tableViewData[indexPath.section][indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "POPULAR SPECIALITIES"
        case 1:
            return "ALL SPECIALITIES"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedSpeciality = self.tableViewData[indexPath.section][indexPath.row]
        let screenWidth = UIScreen.main.bounds.width - 10
        let screenHeight = 240.0
        
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: screenWidth, height: screenHeight)
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        vc.view.addSubview(datePicker)
        NSLayoutConstraint.activate([
            datePicker.leadingAnchor.constraint(equalTo: vc.view.leadingAnchor, constant: 16),
            datePicker.trailingAnchor.constraint(equalTo: vc.view.trailingAnchor, constant: -16)
        ])
        
        let pickerSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        pickerSheet.setValue(vc, forKey: "contentViewController")
        pickerSheet.title = selectedSpeciality
        pickerSheet.addAction(UIAlertAction(title: "Done", style: .cancel, handler: { action in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yy-MM-dd"
            let date = datePicker.date
            self.interactor.didSelectSpeciality(selectedSpeciality: selectedSpeciality, date: date)
        }))
        pickerSheet.addAction(UIAlertAction(title: "Skip", style: .default, handler: { action in
            self.interactor.didSelectSpeciality(selectedSpeciality: selectedSpeciality, date: nil)
        }))
        present(pickerSheet, animated: true, completion: nil)
    }
}

