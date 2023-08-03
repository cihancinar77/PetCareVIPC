//
//  MyPetsView.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 14.07.2023.
//

import UIKit

final class MyPetsView: UIView {

    let tableView: UITableView = {
       let view = UITableView()
        view.backgroundColor = .clear
        view.estimatedRowHeight = UITableView.automaticDimension
        view.register(MyPetsTableViewCell.self, forCellReuseIdentifier: "MyPetsTableViewCell")
        view.separatorStyle = .none
        view.allowsSelection = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
	override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setup() {
        backgroundColor = Colors.pageGrey
        addSubview(tableView)
		NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
		])
	}
}
