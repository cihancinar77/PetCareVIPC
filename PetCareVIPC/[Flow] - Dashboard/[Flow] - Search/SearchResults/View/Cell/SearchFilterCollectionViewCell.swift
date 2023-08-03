//
//  SearchFilterCollectionViewCell.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 25.07.2023.
//

import UIKit

class SearchFilterCollectionViewCell: UICollectionViewCell {
    
    private let title: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.textAlignment = .center
        view.numberOfLines = 1
        view.font = UIFont(name: Fonts.EncodeSans.semiBold, size: FontSize.h5Headline)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func reloadWith(text: String) {
        contentView.layer.cornerRadius = 6
        contentView.backgroundColor = Colors.violet
        title.text = text
        contentView.addSubview(title)
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])
    }
}
