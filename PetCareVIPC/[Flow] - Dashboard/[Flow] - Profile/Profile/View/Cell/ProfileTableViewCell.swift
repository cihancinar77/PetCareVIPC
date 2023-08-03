//
//  ProfileTableViewCell.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 14.07.2023.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private let holderView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var cellStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 15
        view.distribution = .fill
        view.alignment = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let imageHolderView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 18
        view.backgroundColor = Colors.violet?.withAlphaComponent(0.1)
        return view
    }()
    
    private let cellImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let cellLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.numberOfLines = 1
        view.font = UIFont(name: Fonts.EncodeSans.regular, size: FontSize.body1)
        return view
    }()

    private let chevronImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.image = UIImage(systemName: "chevron.right")?.withTintColor(Colors.grey!, renderingMode: .alwaysOriginal)
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func reloadWith(data: ProfileTableViewModel) {
        backgroundColor = .clear
        selectionStyle = .none
        cellImage.image = UIImage(systemName: data.image)?.withTintColor(Colors.violet!, renderingMode: .alwaysOriginal)
        cellLabel.text = data.title
        
        contentView.addSubview(holderView)
        holderView.addSubview(cellStackView)
        holderView.addSubview(chevronImage)
        cellStackView.addArrangedSubview(imageHolderView)
        cellStackView.addArrangedSubview(cellLabel)
        imageHolderView.addSubview(cellImage)
        
        NSLayoutConstraint.activate([
            
            holderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            holderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            holderView.topAnchor.constraint(equalTo: contentView.topAnchor),
            holderView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            cellStackView.topAnchor.constraint(equalTo: holderView.topAnchor, constant: 10),
            cellStackView.leadingAnchor.constraint(equalTo: holderView.leadingAnchor, constant: 5),
            cellStackView.trailingAnchor.constraint(equalTo: holderView.trailingAnchor, constant: -5),
            cellStackView.bottomAnchor.constraint(equalTo: holderView.bottomAnchor, constant: -10),
           
            
            imageHolderView.widthAnchor.constraint(equalToConstant: 36),
            imageHolderView.heightAnchor.constraint(equalToConstant: 36),
            cellImage.centerYAnchor.constraint(equalTo: imageHolderView.centerYAnchor),
            cellImage.centerXAnchor.constraint(equalTo: imageHolderView.centerXAnchor),
            
            chevronImage.widthAnchor.constraint(equalToConstant: 8),
            chevronImage.heightAnchor.constraint(equalToConstant: 13),
            chevronImage.trailingAnchor.constraint(equalTo: holderView.trailingAnchor, constant: -10),
            chevronImage.centerYAnchor.constraint(equalTo: holderView.centerYAnchor),
        ])
    }
}
