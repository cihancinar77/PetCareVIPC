//
//  MyPetsViewController.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 14.07.2023.
//

import UIKit

protocol MyPetsViewControllerProtocol: AnyObject {
	func display(viewState: MyPetsViewState)
}

final class MyPetsViewController: UIViewController {

    
    private var tableViewModel: [MyPetsViewModel] = []
	private let interactor: MyPetsInteractorProtocol
	init(interactor: MyPetsInteractorProtocol) {
		self.interactor = interactor
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private let customView = MyPetsView()

	override func loadView() {
		view = customView
	}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor.viewDidLoad()
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
        prepareNavigationBar()
		interactor.viewDidLoad()
	}
    
    private func prepareNavigationBar() {
        self.title = "My pets"
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        let pencilImage = UIImage(systemName: "plus")?.withTintColor(Colors.violet!, renderingMode: .alwaysOriginal)
        let editButton = UIButton(type: .system)
        editButton.setImage(pencilImage, for: .normal)
        editButton.setTitleColor(Colors.violet, for: .normal)
        editButton.sizeToFit()
        editButton.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)
        let editBarButtonItem = UIBarButtonItem(customView: editButton)
        navigationItem.rightBarButtonItem = editBarButtonItem
    }
    
    @objc private func didTapAddButton() {
        interactor.didTapAddButton()
    }
}

// MARK: - MyPetsViewControllerProtocol
extension MyPetsViewController: MyPetsViewControllerProtocol {

	func display(viewState: MyPetsViewState) {
        switch viewState {
        case .initial(let myPet):
            tableViewModel.append(myPet)
            customView.tableView.reloadData()
        }
	}
}

extension MyPetsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyPetsTableViewCell", for: indexPath) as! MyPetsTableViewCell
        cell.reloadWith(data: tableViewModel[indexPath.row])
        return cell
    }
}
