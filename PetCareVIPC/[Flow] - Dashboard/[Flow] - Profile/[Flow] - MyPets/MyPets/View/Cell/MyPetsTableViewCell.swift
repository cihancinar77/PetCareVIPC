//
//  MyPetsTableViewCell.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 15.07.2023.
//

import UIKit

class MyPetsTableViewCell: UITableViewCell {
    
    private let holderView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 18
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let topStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fill
        view.alignment = .center
        view.spacing = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let petImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "noImage")
        view.tintColor = Colors.grey
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 56
        view.clipsToBounds = true
        return view
    }()
    
    let petNameLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: Fonts.EncodeSans.bold, size: FontSize.h2Headline)
        view.textColor = Colors.black
        view.text = "Troy"
        view.textAlignment = .center
        view.numberOfLines = 1
        return view
    }()
    
    let breedLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: Fonts.EncodeSans.medium, size: FontSize.body1)
        view.textColor = Colors.grey
        view.text = "Toy terrier"
        view.textAlignment = .center
        view.numberOfLines = 1
        return view
    }()
    
    let editButton: UIButton = {
        let view = UIButton(type: .system)
        let pencilImage = UIImage(systemName: "pencil")?.withTintColor(Colors.violet!, renderingMode: .alwaysOriginal)
        view.setImage(pencilImage, for: .normal)
        view.setTitle("Edit", for: .normal)
        view.titleLabel?.textAlignment = .right
        view.setTitleColor(Colors.violet, for: .normal)
        view.titleLabel?.font = UIFont(name: Fonts.EncodeSans.semiBold, size: FontSize.h6Headline)
        view.sizeToFit()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func reloadWith(data: MyPetsViewModel) {
        
        petImageView.image = data.image
        petNameLabel.text = data.name
        breedLabel.text = data.breed
        
        backgroundColor = .clear
        contentView.addSubview(holderView)
        holderView.addSubview(topStackView)
        holderView.addSubview(editButton)
        topStackView.addArrangedSubview(petImageView)
        topStackView.addArrangedSubview(petNameLabel)
        topStackView.addArrangedSubview(breedLabel)
        
        NSLayoutConstraint.activate([
            
            holderView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            holderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            holderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            holderView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            topStackView.topAnchor.constraint(equalTo: holderView.topAnchor, constant: 45),
            topStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            topStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            topStackView.bottomAnchor.constraint(equalTo: holderView.bottomAnchor, constant: -40),
            petImageView.heightAnchor.constraint(equalToConstant: 112),
            petImageView.widthAnchor.constraint(equalToConstant: 112),

            editButton.topAnchor.constraint(equalTo: holderView.topAnchor, constant: 24),
            editButton.trailingAnchor.constraint(equalTo: holderView.trailingAnchor, constant: -24),
            editButton.widthAnchor.constraint(equalToConstant: 58)
        ])
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
