//
//  TutorialsCollectionViewCell.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 4.07.2023.
//

import UIKit

class TutorialsCollectionViewCell: UICollectionViewCell {
    
    var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
//		view.contentMode = .scaleAspectFill
        return view
    }()
    
    func reloadWith(image: String) {
        imageView.image = UIImage(named: image)
        contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
			imageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
			imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ])
    }
}
