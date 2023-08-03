//
//  TutorialsView.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 4.07.2023.
//

import UIKit

final class TutorialsView: UIView {

	override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
    
    lazy var tutorialsCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
		layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//        layout.sectionInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.isPagingEnabled = true
        view.register(TutorialsCollectionViewCell.self, forCellWithReuseIdentifier: "TutorialsCell")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let pageControl: UIPageControl = {
        let view = UIPageControl()
		view.currentPageIndicatorTintColor = Colors.orange
		view.pageIndicatorTintColor = .lightGray
		view.translatesAutoresizingMaskIntoConstraints = false
        return view
	}()
    
    let labelsStackView: UIStackView = {
       let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .fill
        view.spacing = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let headlineLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: Fonts.EncodeSans.bold, size: FontSize.h2Headline)
        view.textColor = Colors.black
        view.textAlignment = .center
        view.numberOfLines = 1
        return view
    }()
    
    let bodyLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: Fonts.EncodeSans.regular, size: FontSize.body1)
        view.textColor = Colors.black
        view.textAlignment = .center
        view.numberOfLines = 2
        return view
    }()
    
    let nextButton: UIButton = {
        let view = UIButton()
        view.titleLabel?.font = UIFont(name: Fonts.EncodeSans.bold, size: FontSize.button)
        view.backgroundColor = Colors.violet
        view.setTitleColor(.white, for: .normal)
        view.contentMode = .center
        view.layer.cornerRadius = 24
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

	private func setup() {
		
		backgroundColor = .white
		
        addSubview(tutorialsCollectionView)
        addSubview(pageControl)
        addSubview(labelsStackView)
        labelsStackView.addArrangedSubview(headlineLabel)
        labelsStackView.addArrangedSubview(bodyLabel)
        addSubview(nextButton)
        
		NSLayoutConstraint.activate([
			
            tutorialsCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tutorialsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tutorialsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tutorialsCollectionView.heightAnchor.constraint(equalToConstant: 392),
			
            pageControl.topAnchor.constraint(equalTo: tutorialsCollectionView.bottomAnchor, constant: 10),
            pageControl.centerXAnchor.constraint(equalTo: centerXAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 20),
			
            labelsStackView.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 10),
			labelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
			labelsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
			
            nextButton.topAnchor.constraint(equalTo: labelsStackView.bottomAnchor, constant: 30),
            nextButton.widthAnchor.constraint(equalToConstant: 260),
            nextButton.heightAnchor.constraint(equalToConstant: 46),
            nextButton.centerXAnchor.constraint(equalTo: centerXAnchor)
		])
	}
}
