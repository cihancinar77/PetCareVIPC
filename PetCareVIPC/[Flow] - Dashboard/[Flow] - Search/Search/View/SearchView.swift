//
//  SearchView.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 10.07.2023.
//

import UIKit

final class SearchView: UIView {
    
    let headlineLabel: UILabel = {
        let view = UILabel()
        view.textAlignment = .left
        view.numberOfLines = 3
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let searchCollectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.sectionInset = .init(top: 20, left: 40, bottom: 20, right: 40)
        layout.itemSize = CGSize(width: 88, height: 88)
       // layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "SearchCell")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
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
        addSubview(headlineLabel)
        addSubview(searchCollectionView)
		NSLayoutConstraint.activate([
            
            headlineLabel.bottomAnchor.constraint(equalTo: searchCollectionView.topAnchor, constant: -49),
            headlineLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            headlineLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            searchCollectionView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 70),
            searchCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchCollectionView.heightAnchor.constraint(equalToConstant: 326)
		])
	}
}
