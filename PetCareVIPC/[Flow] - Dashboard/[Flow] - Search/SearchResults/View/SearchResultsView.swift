//
//  SearchResultsView.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 24.07.2023.
//

import UIKit

final class SearchResultsView: UIView {

    private let topBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let segmentedControl: UISegmentedControl = {
        let view = UISegmentedControl(items: ["Specialists", "Clinics"])
        view.selectedSegmentTintColor = Colors.violet
        view.tintColor = .white
        let normalAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        view.setTitleTextAttributes(normalAttributes, for: .normal)
        let selectedAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        view.setTitleTextAttributes(selectedAttributes, for: .selected)
        return view
    }()
    
    let tableView: UITableView = {
       let view = UITableView()
        view.backgroundColor = .clear
        view.estimatedRowHeight = UITableView.automaticDimension
        view.register(SearchResultsTableViewCell.self, forCellReuseIdentifier: "SearchResultsTableViewCell")
        view.separatorStyle = .none
        view.allowsSelection = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let searchBar: UISearchBar = {
        let view = UISearchBar()
        view.placeholder = "Search"
        view.showsCancelButton = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 16
        layout.minimumLineSpacing = 16
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.isPagingEnabled = false
        view.register(SearchFilterCollectionViewCell.self, forCellWithReuseIdentifier: "SearchFilterCollectionViewCell")
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
        addSubview(topBackground)
        addSubview(searchBar)
        addSubview(collectionView)
        
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            
            topBackground.topAnchor.constraint(equalTo: topAnchor),
            topBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            topBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 38),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        
            collectionView.heightAnchor.constraint(equalToConstant: 30),
            collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            topBackground.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 16),
            
            tableView.topAnchor.constraint(equalTo: topBackground.bottomAnchor,  constant: 8),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
