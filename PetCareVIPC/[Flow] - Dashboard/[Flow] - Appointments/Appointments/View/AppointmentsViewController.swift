//
//  AppointmentsViewController.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 10.07.2023.
//

import UIKit

protocol AppointmentsViewControllerProtocol: AnyObject {
    func display(viewState: AppointmentsViewState)
}

final class AppointmentsViewController: UIViewController {
    
    private var tableViewModel: [AppointmentsTableViewModel] = []
    private let interactor: AppointmentsInteractorProtocol
    
    init(interactor: AppointmentsInteractorProtocol) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let customView = AppointmentsView()
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
        customView.segmentedControl.addTarget(self, action: #selector(didSegmentValueChanged), for: .valueChanged)
        interactor.viewDidLoad()
    }
    
    @objc private func didSegmentValueChanged() {
        interactor.didSegmentValueChanged(selected: customView.segmentedControl.selectedSegmentIndex)
    }
}

// MARK: - AppointmentsViewControllerProtocol
extension AppointmentsViewController: AppointmentsViewControllerProtocol {
    
    func display(viewState: AppointmentsViewState) {
        switch viewState {
        case .initial(let tableViewModel, let selectedSegmentIndex):
            customView.segmentedControl.selectedSegmentIndex = selectedSegmentIndex
            if tableViewModel.isEmpty {
                customView.noAppointmentsStackView.isHidden = false
                customView.actionButton.isHidden = false
                customView.tableView.isHidden = true
            } else {
                customView.noAppointmentsStackView.isHidden = true
                customView.actionButton.isHidden = true
                customView.tableView.isHidden = false
                self.tableViewModel = tableViewModel
                customView.tableView.reloadData()
            }
        }
    }
}

extension AppointmentsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      // let cell = tableView.dequeueReusableCell(withIdentifier: "AppointmentTableViewCell", for: indexPath) as! AppointmentTableViewCell
      // cell.reloadWith(viewModel: tableViewModel[indexPath.row])
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppointmentsTableViewCell2", for: indexPath) as! AppointmentsTableViewCell2
        cell.reloadWith(viewModel: tableViewModel[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
}
