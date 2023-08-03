//
//  AppointmentsView.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 10.07.2023.
//

import UIKit

final class AppointmentsView: UIView {
    
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
        view.alignment = .fill
        view.spacing = 24
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let headlineLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: Fonts.EncodeSans.bold, size: FontSize.h3Headline)
        view.textColor = Colors.black
        view.text = "Appointments"
        view.textAlignment = .center
        view.numberOfLines = 1
        return view
    }()
    
    
    let segmentedControl: UISegmentedControl = {
        let view = UISegmentedControl(items: ["Upcoming", "Past"])
        view.selectedSegmentTintColor = Colors.violet
        view.tintColor = .white
        let normalAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        view.setTitleTextAttributes(normalAttributes, for: .normal)
        let selectedAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        view.setTitleTextAttributes(selectedAttributes, for: .selected)
        return view
    }()
    
    let noAppointmentsStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fill
        view.alignment = .center
        view.spacing = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let noAppointmentsImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "noAppointmentClock")
        view.tintColor = Colors.grey
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    let noAppointmentsLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: Fonts.EncodeSans.regular, size: FontSize.body1)
        view.textColor = Colors.grey
        view.text = "No appointments yet"
        view.textAlignment = .center
        view.numberOfLines = 1
        return view
    }()
    
    let tableView: UITableView = {
       let view = UITableView()
        view.backgroundColor = .clear
        view.estimatedRowHeight = UITableView.automaticDimension
        view.register(UINib(nibName: "AppointmentsTableViewCell", bundle: nil), forCellReuseIdentifier: "AppointmentsTableViewCell")
		view.register(AppointmentsTableViewCell2.self, forCellReuseIdentifier: "AppointmentsTableViewCell2")
        //view.register(AppointmentTableViewCell.self, forCellReuseIdentifier: "AppointmentTableViewCell")
        view.separatorStyle = .none
        view.allowsSelection = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let actionButton: UIButton = {
        let view = UIButton()
        view.titleLabel?.font = UIFont(name: Fonts.EncodeSans.bold, size: FontSize.button)
        view.backgroundColor = Colors.violet
        view.setTitleColor(.white, for: .normal)
        view.contentMode = .center
        view.setTitle("Find a specialist", for: .normal)
        view.layer.cornerRadius = 24
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
        addSubview(stackViewHolder)
        stackViewHolder.addSubview(topStackView)
        topStackView.addArrangedSubview(headlineLabel)
        topStackView.addArrangedSubview(segmentedControl)
        addSubview(noAppointmentsStackView)
        addSubview(tableView)
        noAppointmentsStackView.addArrangedSubview(noAppointmentsImageView)
        noAppointmentsStackView.addArrangedSubview(noAppointmentsLabel)
        addSubview(actionButton)
        
        NSLayoutConstraint.activate([
            
            stackViewHolder.topAnchor.constraint(equalTo: topAnchor),
            stackViewHolder.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackViewHolder.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackViewHolder.heightAnchor.constraint(equalToConstant: 176),
            
            topStackView.centerYAnchor.constraint(equalTo: stackViewHolder.centerYAnchor),
            topStackView.centerXAnchor.constraint(equalTo: stackViewHolder.centerXAnchor),
            topStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            topStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            segmentedControl.heightAnchor.constraint(equalToConstant: 38),
            
            noAppointmentsStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            noAppointmentsStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            noAppointmentsImageView.heightAnchor.constraint(equalToConstant: 102),
            noAppointmentsImageView.widthAnchor.constraint(equalToConstant: 102),
            
            tableView.topAnchor.constraint(equalTo: stackViewHolder.bottomAnchor,  constant: 20),
            tableView.centerXAnchor.constraint(equalTo: centerXAnchor),
			tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
			tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

            actionButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            actionButton.widthAnchor.constraint(equalToConstant: 240),
            actionButton.heightAnchor.constraint(equalToConstant: 46),
            actionButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -80)
        ])
    }
}
