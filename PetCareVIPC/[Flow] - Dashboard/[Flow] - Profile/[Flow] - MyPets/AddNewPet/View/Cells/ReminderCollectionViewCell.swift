//
//  ReminderCollectionViewCell.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 21.07.2023.
//

import UIKit

class ReminderCollectionViewCell: UICollectionViewCell {
    
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
        view.tintColor = .white
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    let titleLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: Fonts.EncodeSans.semiBold, size: FontSize.h5Headline)
        view.textColor = Colors.black
        view.textAlignment = .center
        view.numberOfLines = 1
        return view
    }()
    
    let dateLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: Fonts.EncodeSans.regular, size: FontSize.body3)
        view.textColor = Colors.grey
        view.textAlignment = .center
        view.numberOfLines = 1
        return view
    }()
    
    
    func reloadWith(icon: UIImage, title: String, date: String) {
        backgroundColor = .white
        layer.cornerRadius = 16
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 6, height: 6)
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 3
        layer.masksToBounds = false
        
        iconImageView.image = icon.withTintColor(Colors.violet!, renderingMode: .alwaysOriginal)
        titleLabel.text = title
        dateLabel.text = date
        
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(dateLabel)
        
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
