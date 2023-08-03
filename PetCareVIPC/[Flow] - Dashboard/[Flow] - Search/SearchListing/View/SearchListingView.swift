//
//  SearchListingView.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 22.07.2023.
//

import UIKit

final class SearchListingView: UIView {

    let tableView: UITableView = {
       let view = UITableView()
        view.backgroundColor = .clear
        view.estimatedRowHeight = UITableView.automaticDimension
        view.separatorStyle = .none
        view.allowsSelection = true
        view.alwaysBounceVertical = false
        view.register(SearchListingTableViewCell.self, forCellReuseIdentifier: "SearchListingTableViewCell")
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

	private func addSubviews() {

	}

	private func setup() {
        backgroundColor = .white
        addSubview(tableView)
        
		NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}
}
