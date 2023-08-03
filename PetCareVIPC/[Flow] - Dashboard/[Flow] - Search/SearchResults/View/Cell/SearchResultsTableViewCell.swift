//
//  SearchResultsTableViewCell.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 24.07.2023.
//

import UIKit

class SearchResultsTableViewCell: UITableViewCell {

    private let contentStackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 14
        view.axis = .vertical
        view.distribution = .fill
        view.alignment = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let topStackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 16
        view.axis = .horizontal
        view.distribution = .fill
        view.alignment = .firstBaseline
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let topRightStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 8
        view.distribution = .fill
        view.alignment = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [title, subtitle])
        view.axis = .vertical
        view.distribution = .fill
        view.alignment = .fill
        return view
    }()
    
    private let title: UILabel = {
        let view = UILabel()
        view.text = "Alekseenko Tirriko"
        view.textColor = .black
        view.numberOfLines = 0
        view.font = UIFont(name: Fonts.EncodeSans.bold, size: FontSize.h3Headline)
        return view
    }()
    
    private let subtitle: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.text = "Veterinary Dentist"
        view.numberOfLines = 0
        view.font = UIFont(name: Fonts.EncodeSans.semiBold, size: FontSize.h5Headline)
        return view
    }()
    
    private lazy var reviewStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [starView, reviewLabel])
        view.axis = .horizontal
        view.spacing = 16
        view.distribution = .fill
        view.alignment = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let reviewLabel: UILabel = {
        let view = UILabel()
        view.textColor = Colors.grey
        view.text = "125 Reviews"
        view.numberOfLines = 0
        view.font = UIFont(name: Fonts.EncodeSans.medium, size: FontSize.caption)
        return view
    }()
    
   
    private let starView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "5stars")
        view.contentMode = .scaleAspectFit
        return view
    }()

    private let holderView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 14
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let profileImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.backgroundColor = .red
        view.layer.cornerRadius = 18
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var distanceAndCostStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 12
        view.distribution = .fill
        view.alignment = .fill
        return view
    }()
    
    private lazy var distanceStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 8
        view.distribution = .fill
        view.alignment = .fill
        return view
    }()
    
    private let distanceImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.image = UIImage(named: "mapPin")
        view.clipsToBounds = true
        return view
    }()
    
    private let distanceLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.text = "1.5 km"
        view.numberOfLines = 0
        view.font = UIFont(name: Fonts.EncodeSans.medium, size: FontSize.caption)
        return view
    }()
    
    private lazy var costStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 8
        view.distribution = .fill
        view.alignment = .fill
        return view
    }()
    
    private let costImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.image = UIImage(named: "wallet")
        view.clipsToBounds = true
        return view
    }()
    
    private let costLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.text = "$20"
        view.numberOfLines = 0
        view.font = UIFont(name: Fonts.EncodeSans.medium, size: FontSize.caption)
        return view
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func reloadWith(viewModel: SearchResultsTableViewModel) {
        self.backgroundColor = .clear
        
        holderView.layer.shadowColor = UIColor.lightGray.cgColor
        holderView.layer.shadowOffset = CGSize(width: 6, height: 6)
        holderView.layer.shadowOpacity = 0.3
        holderView.layer.shadowRadius = 3
        holderView.layer.masksToBounds = false
       
        
        subtitle.text = viewModel.title
        subtitle.textColor = .black
        title.text = viewModel.name
        reviewLabel.text = viewModel.numberOfReviews
        title.textColor = .black
        distanceLabel.text = viewModel.distance
        costLabel.text = viewModel.cost
        
        if let img = viewModel.image, let url = URL(string: img) {
            let iData = try? Data(contentsOf: url)
            if let imageData = iData {
                let image = UIImage(data: imageData)
                profileImage.image = image
            }
        }

        contentView.addSubview(holderView)
        holderView.addSubview(contentStackView)
        
        topStackView.addArrangedSubview(profileImage)
        topStackView.addArrangedSubview(topRightStackView)
        
        topRightStackView.addArrangedSubview(titleStackView)
        topRightStackView.addArrangedSubview(reviewStackView)
        topRightStackView.addArrangedSubview(distanceAndCostStackView)
        
        distanceAndCostStackView.addArrangedSubview(distanceStackView)
        distanceAndCostStackView.addArrangedSubview(costStackView)
        distanceStackView.addArrangedSubview(distanceImage)
        distanceStackView.addArrangedSubview(distanceLabel)
        costStackView.addArrangedSubview(costImage)
        costStackView.addArrangedSubview(costLabel)
        contentStackView.addArrangedSubview(topStackView)

        NSLayoutConstraint.activate([
            holderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            holderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            holderView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            holderView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            profileImage.widthAnchor.constraint(equalToConstant: 88),
            profileImage.heightAnchor.constraint(equalToConstant: 88),
            
            distanceImage.widthAnchor.constraint(equalToConstant: 24),
            distanceImage.heightAnchor.constraint(equalToConstant: 24),
            costImage.widthAnchor.constraint(equalToConstant: 24),
            costImage.heightAnchor.constraint(equalToConstant: 24),
            
            contentStackView.trailingAnchor.constraint(equalTo: holderView.trailingAnchor, constant: -16),
            contentStackView.leadingAnchor.constraint(equalTo: holderView.leadingAnchor, constant: 16),
            contentStackView.topAnchor.constraint(equalTo: holderView.topAnchor, constant: 8),
            contentStackView.bottomAnchor.constraint(equalTo: holderView.bottomAnchor, constant: -8),
        ])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
