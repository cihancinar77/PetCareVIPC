//
//  ProfileViewController.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 10.07.2023.
//

import UIKit

protocol ProfileViewControllerProtocol: AnyObject {
	func display(viewState: ProfileViewState)
}

final class ProfileViewController: UIViewController {

    private var tableViewModel: [ProfileTableViewModel] = []
	private let interactor: ProfileInteractorProtocol

	init(interactor: ProfileInteractorProtocol) {
		self.interactor = interactor
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private let customView = ProfileView()

	override func loadView() {
		view = customView
	}

    override func viewDidLoad() {
        super.viewDidLoad()
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
        prepareNavigationBar()
        interactor.viewDidLoad()
	}
    
    @objc private func didTapEditButton() {
        print("didTapEditButton")
    }
    
    private func prepareNavigationBar() {
        self.title = "Profile"
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        let pencilImage = UIImage(systemName: "pencil")?.withTintColor(Colors.violet!, renderingMode: .alwaysOriginal)
        let editButton = UIButton(type: .system)
        editButton.setImage(pencilImage, for: .normal)
        editButton.setTitle("Edit", for: .normal)
        editButton.setTitleColor(Colors.violet, for: .normal)
        editButton.sizeToFit()
        editButton.addTarget(self, action: #selector(didTapEditButton), for: .touchUpInside)
        let editBarButtonItem = UIBarButtonItem(customView: editButton)
        navigationItem.rightBarButtonItem = editBarButtonItem
    }
}

// MARK: - ProfileViewControllerProtocol
extension ProfileViewController: ProfileViewControllerProtocol {

	func display(viewState: ProfileViewState) {
        switch viewState {
        case .initial(let profileTableViewModel, let userData):
            customView.nameLabel.text = userData.fullname
            self.tableViewModel = profileTableViewModel
            customView.tableView.reloadData()
        }
	}
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
        cell.reloadWith(data: tableViewModel[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        interactor.didSelectCell(index: indexPath.row)
    }
}
