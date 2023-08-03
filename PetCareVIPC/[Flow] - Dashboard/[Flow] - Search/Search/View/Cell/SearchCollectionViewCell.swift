//
//  SearchCollectionViewCell.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 10.07.2023.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    private var cellId = ""
    
    private let cellImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let cellLabel: UILabel = {
        let view = UILabel()
        view.textColor = Colors.black
        view.font = UIFont(name: Fonts.EncodeSans.regular, size: FontSize.body3)
        view.contentMode = .center
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func reloadWith(data: SearchCollectionViewModel) {
        self.backgroundColor = .white
        
        layer.cornerRadius = 30
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 6, height: 6)
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 3
        layer.masksToBounds = false
        cellImageView.image = UIImage(named: data.image)
        cellLabel.text = data.headline
        cellId = data.id
        addSubview(cellImageView)
        addSubview(cellLabel)
        
        NSLayoutConstraint.activate([
            cellImageView.topAnchor.constraint(equalTo: topAnchor, constant: 14),
            cellImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            cellImageView.heightAnchor.constraint(equalToConstant: 40),
            
            cellLabel.topAnchor.constraint(equalTo: cellImageView.bottomAnchor, constant: 6),
            cellLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            cellLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            cellLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            cellLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        ])
    }
}
