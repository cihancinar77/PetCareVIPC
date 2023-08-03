//
//  ProfileView.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 10.07.2023.
//

import UIKit

final class ProfileView: UIView {

    private let stackViewHolder: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let topStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fill
        view.alignment = .center
        view.spacing = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let profileImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "noImage")
        view.tintColor = Colors.grey
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 56
        view.clipsToBounds = true
        return view
    }()
    
    let nameLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: Fonts.EncodeSans.bold, size: FontSize.h2Headline)
        view.textColor = Colors.black
        view.text = "Maria Martinez"
        view.textAlignment = .center
        view.numberOfLines = 1
        return view
    }()
    
    let locationLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: Fonts.EncodeSans.medium, size: FontSize.body1)
        view.textColor = Colors.grey
        view.text = "Kiev"
        view.textAlignment = .center
        view.numberOfLines = 1
        return view
    }()
    
    let tableView: UITableView = {
       let view = UITableView()
        view.backgroundColor = .clear
        view.estimatedRowHeight = UITableView.automaticDimension
        view.register(ProfileTableViewCell.self, forCellReuseIdentifier: "ProfileTableViewCell")
        view.separatorStyle = .singleLine
        view.separatorColor = Colors.grey
        view.allowsSelection = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Colors.pageGrey
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = Colors.pageGrey
        addSubview(stackViewHolder)
        stackViewHolder.addSubview(topStackView)
        topStackView.addArrangedSubview(profileImageView)
        topStackView.addArrangedSubview(nameLabel)
        topStackView.addArrangedSubview(locationLabel)
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            
            stackViewHolder.topAnchor.constraint(equalTo: topAnchor),
            stackViewHolder.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackViewHolder.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            topStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            topStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            topStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            topStackView.bottomAnchor.constraint(equalTo: stackViewHolder.bottomAnchor, constant: -20),
            profileImageView.heightAnchor.constraint(equalToConstant: 112),
            profileImageView.widthAnchor.constraint(equalToConstant: 112),

            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 30)
        ])
    }
}
