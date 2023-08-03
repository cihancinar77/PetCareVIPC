//
//  AddEventCollectionViewCell.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 21.07.2023.
//

import UIKit

class AddEventCollectionViewCell: UICollectionViewCell {
    
    let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fill
        view.alignment = .center
        view.spacing = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .blue
        view.image = UIImage(named: "addIcon")
        view.tintColor = Colors.grey
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    
    let titleLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: Fonts.EncodeSans.semiBold, size: FontSize.h5Headline)
        view.textColor = Colors.black
        view.text = "Add event"
        view.textAlignment = .center
        view.numberOfLines = 1
        return view
    }()

    func reloadWith() {
        layer.cornerRadius = 16
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 6, height: 6)
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 3
        layer.masksToBounds = false
        backgroundColor = Colors.lightGrey
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
            
            iconImageView.widthAnchor.constraint(equalToConstant: 40),
            iconImageView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
}
