//
//  AddNewPetView.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 15.07.2023.
//

import UIKit

final class AddNewPetView: UIView {
    
    private var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var scrollContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let petImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "noImage")
        view.tintColor = Colors.grey
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 56
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let petImageAddButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "addIcon"), for: .normal)
        view.sizeToFit()
        view.heightAnchor.constraint(equalToConstant: 29).isActive = true
        view.widthAnchor.constraint(equalToConstant: 29).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var topStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [headlineLabel, petsNameStackView, speciesStackView, breedStackView, sizeStackView, genderStackView, dobStackView])
        view.axis = .vertical
        view.spacing = 16
        view.distribution = .fill
        view.alignment = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let headlineLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.textAlignment = .left
        view.text = "General information"
        view.numberOfLines = 1
        view.font = UIFont(name: Fonts.EncodeSans.bold, size: FontSize.h3Headline)
        return view
    }()
    
    private lazy var petsNameStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [petsNameTitleLabel, petsNameTextField, petsNameSeperatorView])
        view.axis = .vertical
        view.spacing = 6
        view.distribution = .fill
        view.alignment = .fill
        return view
    }()
    
    private let petsNameTitleLabel: UILabel = {
        let view = UILabel()
        view.textColor = .lightGray
        view.text = "Pet's name"
        view.numberOfLines = 1
        view.font = UIFont(name: Fonts.EncodeSans.semiBold, size: FontSize.h6Headline)
        return view
    }()
    
    let petsNameTextField: UITextField = {
        let view = UITextField()
        view.backgroundColor = .clear
        view.autocorrectionType = .no
        view.autocapitalizationType = .none
        view.placeholder = ""
        view.textAlignment = .left
        view.textColor = .black
        view.setPlaceholderTextColor(.darkGray)
        return view
    }()
    
    let petsNameSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.grey
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return view
    }()
    
    private lazy var speciesStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [speciesTitleLabel, speciesTextfieldStackView, speciesSeperatorView])
        view.axis = .vertical
        view.spacing = 6
        view.distribution = .fill
        view.alignment = .fill
        return view
    }()
    
    private let speciesTitleLabel: UILabel = {
        let view = UILabel()
        view.textColor = .lightGray
        view.text = "Species of your pet"
        view.numberOfLines = 1
        view.font = UIFont(name: Fonts.EncodeSans.semiBold, size: FontSize.h6Headline)
        view.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return view
    }()
    
    lazy var speciesTextfieldStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [speciesTextField, speciesChevronView])
        view.axis = .horizontal
        view.spacing = 6
        view.distribution = .fill
        view.alignment = .firstBaseline
        return view
    }()
    
    let speciesTextField: UITextField = {
        let view = UITextField()
        view.backgroundColor = .clear
        view.autocorrectionType = .no
        view.autocapitalizationType = .none
        view.placeholder = ""
        view.textAlignment = .left
        view.textColor = .black
        view.isEnabled = false
        view.setPlaceholderTextColor(.darkGray)
        return view
    }()
    
    let speciesChevronView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "chevron.right")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal)
        view.widthAnchor.constraint(equalToConstant: 8).isActive = true
        view.heightAnchor.constraint(equalToConstant: 13).isActive = true
        return view
    }()
    
    
    let speciesSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.grey
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return view
    }()
    
    private lazy var breedStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [breedTitleLabel, breedTextfieldStackView, breedSeperatorView])
        view.axis = .vertical
        view.spacing = 6
        view.distribution = .fill
        view.alignment = .fill
        return view
    }()
    
    private let breedTitleLabel: UILabel = {
        let view = UILabel()
        view.textColor = .lightGray
        view.text = "Breed"
        view.numberOfLines = 1
        view.font = UIFont(name: Fonts.EncodeSans.semiBold, size: FontSize.h6Headline)
        view.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return view
    }()
    
    lazy var breedTextfieldStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [breedTextField, breedChevronView])
        view.axis = .horizontal
        view.spacing = 6
        view.distribution = .fill
        view.alignment = .firstBaseline
        return view
    }()
    
    let breedTextField: UITextField = {
        let view = UITextField()
        view.backgroundColor = .clear
        view.autocorrectionType = .no
        view.autocapitalizationType = .none
        view.placeholder = ""
        view.textAlignment = .left
        view.textColor = .black
        view.isEnabled = false
        view.setPlaceholderTextColor(.darkGray)
        return view
    }()
    
    let breedChevronView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "chevron.right")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal)
        view.widthAnchor.constraint(equalToConstant: 8).isActive = true
        view.heightAnchor.constraint(equalToConstant: 13).isActive = true
        return view
    }()
    
    
    let breedSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.grey
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return view
    }()
    
    private lazy var sizeStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [sizeTitleLabel, sizeTextfieldStackView, sizeSeperatorView])
        view.axis = .vertical
        view.spacing = 6
        view.distribution = .fill
        view.alignment = .fill
        return view
    }()
    
    private let sizeTitleLabel: UILabel = {
        let view = UILabel()
        view.textColor = .lightGray
        view.text = "Size (optional)"
        view.numberOfLines = 1
        view.font = UIFont(name: Fonts.EncodeSans.semiBold, size: FontSize.h6Headline)
        view.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return view
    }()
    
    lazy var sizeTextfieldStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [sizeTextField, sizeChevronView])
        view.axis = .horizontal
        view.spacing = 6
        view.distribution = .fill
        view.alignment = .firstBaseline
        return view
    }()
    
    let sizeTextField: UITextField = {
        let view = UITextField()
        view.backgroundColor = .clear
        view.autocorrectionType = .no
        view.autocapitalizationType = .none
        view.placeholder = "Select"
        view.textAlignment = .left
        view.textColor = .black
        view.isEnabled = false
        view.setPlaceholderTextColor(.darkGray)
        return view
    }()
    
    let sizeChevronView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "chevron.right")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal)
        view.widthAnchor.constraint(equalToConstant: 8).isActive = true
        view.heightAnchor.constraint(equalToConstant: 13).isActive = true
        return view
    }()
    
    let sizeSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.grey
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return view
    }()
    
    private lazy var genderStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [genderTitleLabel, genderSegmentedControl, genderSeperatorView])
        view.axis = .vertical
        view.spacing = 6
        view.distribution = .fill
        view.alignment = .fill
        return view
    }()
    
    private let genderTitleLabel: UILabel = {
        let view = UILabel()
        view.textColor = .lightGray
        view.text = "Gender"
        view.numberOfLines = 1
        view.font = UIFont(name: Fonts.EncodeSans.semiBold, size: FontSize.h6Headline)
        view.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return view
    }()
    
    let genderSegmentedControl: UISegmentedControl = {
        let view = UISegmentedControl(items: ["Male", "Female"])
        view.selectedSegmentTintColor = Colors.violet
        view.tintColor = .white
        view.selectedSegmentIndex = 0
        view.layer.cornerRadius = 18
        let normalAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        view.setTitleTextAttributes(normalAttributes, for: .normal)
        let selectedAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        view.setTitleTextAttributes(selectedAttributes, for: .selected)
        return view
    }()
    
    let genderSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.grey
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return view
    }()
    
    private lazy var dobStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [dobTitleLabel, dobTextfieldStackView, dobSeperatorView])
        view.axis = .vertical
        view.spacing = 6
        view.distribution = .fill
        view.alignment = .fill
        return view
    }()
    
    private let dobTitleLabel: UILabel = {
        let view = UILabel()
        view.textColor = .lightGray
        view.text = "Date of birth"
        view.numberOfLines = 1
        view.font = UIFont(name: Fonts.EncodeSans.semiBold, size: FontSize.h6Headline)
        view.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return view
    }()
    
    lazy var dobTextfieldStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [dobTextField, dobChevronView])
        view.axis = .horizontal
        view.spacing = 6
        view.distribution = .fill
        view.alignment = .firstBaseline
        return view
    }()
    
    let dobTextField: UITextField = {
        let view = UITextField()
        view.backgroundColor = .clear
        view.autocorrectionType = .no
        view.autocapitalizationType = .none
        view.placeholder = ""
        view.textAlignment = .left
        view.textColor = .black
        view.isEnabled = false
        view.setPlaceholderTextColor(.darkGray)
        return view
    }()
    
    let dobChevronView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "chevron.right")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal)
        view.widthAnchor.constraint(equalToConstant: 8).isActive = true
        view.heightAnchor.constraint(equalToConstant: 13).isActive = true
        return view
    }()
    
    let dobSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.grey
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return view
    }()
    
    private lazy var middleStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [midlineLabel, neuteredStackView, vaccinatedStackView, microchippedStackView])
        view.axis = .vertical
        view.spacing = 16
        view.distribution = .fill
        view.alignment = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let midlineLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.textAlignment = .left
        view.text = "Additional Information"
        view.numberOfLines = 1
        view.font = UIFont(name: Fonts.EncodeSans.bold, size: FontSize.h3Headline)
        return view
    }()
    
    lazy var neuteredStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [neuteredTitleLabel, neuteredSwitch])
        view.axis = .horizontal
        view.spacing = 6
        view.distribution = .fill
        view.alignment = .firstBaseline
        return view
    }()
    
    private let neuteredTitleLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.text = "Neutered"
        view.numberOfLines = 1
        view.font = UIFont(name: Fonts.EncodeSans.regular, size: FontSize.body1)
        view.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return view
    }()
    
    let neuteredSwitch: UISwitch = {
        let view = UISwitch()
        view.tag = 0
        view.onTintColor = Colors.violet
        return view
    }()
    
    lazy var vaccinatedStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [vaccinatedTitleLabel, vaccinatedSwitch])
        view.axis = .horizontal
        view.spacing = 6
        view.distribution = .fill
        view.alignment = .firstBaseline
        return view
    }()
    
    private let vaccinatedTitleLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.text = "Vaccinated"
        view.numberOfLines = 1
        view.font = UIFont(name: Fonts.EncodeSans.regular, size: FontSize.body1)
        view.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return view
    }()
    
    let vaccinatedSwitch: UISwitch = {
        let view = UISwitch()
        view.tag = 1
        view.onTintColor = Colors.violet
        return view
    }()
    
    lazy var microchippedStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [microchippedTitleLabel, microchippedSwitch])
        view.axis = .horizontal
        view.spacing = 6
        view.distribution = .fill
        view.alignment = .firstBaseline
        return view
    }()
    
    private let microchippedTitleLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.text = "Microchipped"
        view.numberOfLines = 1
        view.font = UIFont(name: Fonts.EncodeSans.regular, size: FontSize.body1)
        view.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return view
    }()
    
    let microchippedSwitch: UISwitch = {
        let view = UISwitch()
        view.tag = 2
        view.onTintColor = Colors.violet
        return view
    }()
    
    private lazy var bottomStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [bottomlineLabel, descriptionLabel, collectionView, actionButton])
        view.axis = .vertical
        view.spacing = 16
        view.distribution = .fill
        view.alignment = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let bottomlineLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.textAlignment = .left
        view.text = "Reminders"
        view.numberOfLines = 1
        view.font = UIFont(name: Fonts.EncodeSans.bold, size: FontSize.h3Headline)
        return view
    }()
    
    private let descriptionLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.textAlignment = .justified
        view.text = "Add vaccines, haircuts, pills, estrus, etc. and you will receive notifications for the next event."
        view.numberOfLines = 0
        view.font = UIFont(name: Fonts.EncodeSans.regular, size: FontSize.body1)
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 16
        layout.minimumLineSpacing = 16
        layout.itemSize = CGSize(width: 120, height: 144)
        //layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.sectionInset = .init(top: 0, left: 11, bottom: 0, right: 0)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.isPagingEnabled = false
        view.register(AddEventCollectionViewCell.self, forCellWithReuseIdentifier: "AddEventCollectionViewCell")
        view.register(ReminderCollectionViewCell.self, forCellWithReuseIdentifier: "ReminderCollectionViewCell")
        //view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let actionButton: UIButton = {
        let view = UIButton()
        view.titleLabel?.font = UIFont(name: Fonts.EncodeSans.bold, size: FontSize.button)
        view.backgroundColor = Colors.violet
        view.setTitleColor(.white, for: .normal)
        view.contentMode = .center
        view.layer.cornerRadius = 24
        view.setTitle("Save", for: .normal)
        view.heightAnchor.constraint(equalToConstant: 48).isActive = true
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
        backgroundColor = .white
        
        addSubview(scrollView)
        scrollView.addSubview(scrollContentView)
        scrollContentView.addSubview(petImageView)
        scrollContentView.addSubview(petImageAddButton)
        scrollContentView.addSubview(topStackView)
        scrollContentView.addSubview(middleStackView)
        scrollContentView.addSubview(bottomStackView)
        
        NSLayoutConstraint.activate([
            
            petImageView.topAnchor.constraint(equalTo: scrollContentView.topAnchor, constant: 20),
            petImageView.centerXAnchor.constraint(equalTo: scrollContentView.centerXAnchor),
            petImageView.widthAnchor.constraint(equalToConstant: 112),
            petImageView.heightAnchor.constraint(equalToConstant: 112),
            petImageAddButton.topAnchor.constraint(equalTo: petImageView.topAnchor, constant: -4),
            petImageAddButton.trailingAnchor.constraint(equalTo: petImageView.trailingAnchor, constant: -2),
            
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            scrollContentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            scrollContentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            scrollContentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            scrollContentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            scrollContentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            scrollContentView.heightAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.heightAnchor),
            
            topStackView.topAnchor.constraint(equalTo: petImageView.bottomAnchor, constant: 32),
            topStackView.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor, constant: 30),
            topStackView.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor, constant: -30),
            //topStackView.bottomAnchor.constraint(lessThanOrEqualTo: scrollContentView.bottomAnchor, constant: -30),
            
            middleStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 32),
            middleStackView.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor, constant: 30),
            middleStackView.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor, constant: -30),
            //middleStackView.bottomAnchor.constraint(lessThanOrEqualTo: scrollContentView.bottomAnchor, constant: -30),
            
            bottomStackView.topAnchor.constraint(equalTo: middleStackView.bottomAnchor, constant: 32),
            bottomStackView.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor),
            bottomStackView.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor),
            bottomStackView.bottomAnchor.constraint(lessThanOrEqualTo: scrollContentView.bottomAnchor, constant: -30),
            
            bottomlineLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 11),
            bottomlineLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -28),
            descriptionLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 11),
            descriptionLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -28),
            
            collectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 164)
        ])
    }
}


