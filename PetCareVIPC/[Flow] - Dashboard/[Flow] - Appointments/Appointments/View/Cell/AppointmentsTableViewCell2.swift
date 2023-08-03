//
//  AppointmentsTableViewCell2.swift
//  PetCareVIPC
//
//  Created by Serdar Y on 13/07/2023.
//

import UIKit

class AppointmentsTableViewCell2: UITableViewCell {
	
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
	
	private let middleStackView: UIStackView = {
		let view = UIStackView()
		view.spacing = 8
		view.axis = .vertical
		view.distribution = .fill
		view.alignment = .fill
		view.layer.cornerRadius = 16
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	private lazy var workplaceLabel: UILabel = {
		let view = UILabel()
		view.textColor = .black
		view.text = "Veterinary clinic \"Alden-Vet\""
		view.numberOfLines = 0
		view.font = UIFont(name: Fonts.EncodeSans.bold, size: FontSize.h5Headline)
		return view
	}()
	
	private lazy var addressLabel: UILabel = {
		let view = UILabel()
		view.textColor = .black
		view.text = "141 N Union Ave, Los Angeles, CA"
		view.numberOfLines = 0
		view.font = UIFont(name: Fonts.EncodeSans.regular, size: FontSize.body3)
		return view
	}()
	
	private lazy var workplaceIcon: UIImageView = {
		let view = UIImageView(image: .init(named: "workplace")!)
		view.contentMode = .scaleAspectFill
		view.clipsToBounds = true
		return view
	}()
	
	private lazy var workplaceInfoTitleStackView: UIStackView = {
		let view = UIStackView(arrangedSubviews: [workplaceLabel, addressLabel])
		view.axis = .vertical
		view.distribution = .fill
		view.alignment = .fill
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	private lazy var workplaceStackView: UIStackView = {
		let view = UIStackView(arrangedSubviews: [workplaceIcon, workplaceInfoTitleStackView])
		view.axis = .horizontal
		view.spacing = 16
		view.distribution = .fill
		view.alignment = .fill
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	private lazy var timeLabel: UILabel = {
		let view = UILabel()
		view.textColor = .black
		view.text = "Wed 9 Sep — 10:30 am"
		view.numberOfLines = 0
		view.font = UIFont(name: Fonts.EncodeSans.regular, size: FontSize.body3)
		return view
	}()
	
	private lazy var timeIcon: UIImageView = {
		let view = UIImageView(image: .init(named: "time")!)
		view.contentMode = .scaleAspectFill
		return view
	}()
	
	private lazy var timeInfoTitleStackView: UIStackView = {
		let view = UIStackView(arrangedSubviews: [timeLabel])
		view.axis = .vertical
		view.distribution = .fill
		view.alignment = .fill
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	private lazy var timeStackView: UIStackView = {
		let view = UIStackView(arrangedSubviews: [timeIcon, timeInfoTitleStackView])
		view.spacing = 16
		view.axis = .horizontal
		view.distribution = .fill
		view.alignment = .fill
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	private lazy var reviewStackView: UIStackView = {
		let view = UIStackView(arrangedSubviews: [workplaceStackView, timeStackView])
		view.axis = .horizontal
		view.spacing = 16
		view.distribution = .fill
		view.alignment = .fill
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
	
	private let title: UILabel = {
		let view = UILabel()
		view.text = "Alekseenko Tirriko"
		view.textColor = .black
		view.numberOfLines = 0
		view.font = UIFont(name: Fonts.EncodeSans.bold, size: FontSize.h2Headline)
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
	
	private let subtitle: UILabel = {
		let view = UILabel()
		view.textColor = .black
		view.text = "Veterinary Dentist"
		view.numberOfLines = 0
		view.font = UIFont(name: Fonts.EncodeSans.semiBold, size: FontSize.h4Headline)
		return view
	}()
	
	private let starView: UIImageView = {
		let view = UIImageView()
		view.image = UIImage(named: "5stars")
		view.contentMode = .scaleAspectFit
		return view
	}()
	
	private let titleStackView: UIStackView = {
		let view = UIStackView()
		view.axis = .vertical
		view.distribution = .fill
		view.alignment = .fill
		return view
	}()

	private let holderView: UIView = {
		let view = UIView()
		view.layer.cornerRadius = 14
		view.backgroundColor = .white
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	private let middleHolderView: UIView = {
		let view = UIView()
		view.layer.cornerRadius = 16
		view.backgroundColor = Colors.pageGrey
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
	
	private lazy var actionButton: UIButton = {
		let view = UIButton()
		view.titleLabel?.font = UIFont(name: Fonts.EncodeSans.bold, size: FontSize.button)
		view.backgroundColor = Colors.violet
		view.setTitleColor(.white, for: .normal)
		view.contentMode = .center
		view.layer.cornerRadius = 24
		view.setTitle("Edit", for: .normal)
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	private lazy var bottomStackView: UIStackView = {
		let view = UIStackView(arrangedSubviews: [actionButton, cancelButton])
		view.spacing = 15
		view.axis = .horizontal
		view.distribution = .fillEqually
		view.alignment = .fill
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	private let cancelButton: UIButton = {
		let view = UIButton()
		view.titleLabel?.font = UIFont(name: Fonts.EncodeSans.bold, size: FontSize.button)
		view.backgroundColor = Colors.pageGrey
		view.setTitleColor(.white, for: .normal)
		view.contentMode = .center
		view.layer.cornerRadius = 24
		view.setTitle("Cancel", for: .normal)
		view.translatesAutoresizingMaskIntoConstraints = false
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
	
    func reloadWith(viewModel: AppointmentsTableViewModel) {
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
        timeLabel.text = "\(viewModel.date) - \(viewModel.time)"
        title.textColor = .black
        workplaceLabel.text = viewModel.facilityName
        addressLabel.text = viewModel.adress
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
		
		titleStackView.addArrangedSubview(title)
		titleStackView.addArrangedSubview(subtitle)
		
		reviewStackView.addArrangedSubview(starView)
		reviewStackView.addArrangedSubview(reviewLabel)
		
		topRightStackView.addArrangedSubview(titleStackView)
		topRightStackView.addArrangedSubview(reviewStackView)
        topRightStackView.addArrangedSubview(distanceAndCostStackView)
        
        distanceAndCostStackView.addArrangedSubview(distanceStackView)
        distanceAndCostStackView.addArrangedSubview(costStackView)
        distanceStackView.addArrangedSubview(distanceImage)
        distanceStackView.addArrangedSubview(distanceLabel)
        costStackView.addArrangedSubview(costImage)
        costStackView.addArrangedSubview(costLabel)
		
		topStackView.addArrangedSubview(profileImage)
		topStackView.addArrangedSubview(topRightStackView)
		
		middleHolderView.addSubview(middleStackView)
		
		middleStackView.addArrangedSubview(workplaceStackView)
		middleStackView.addArrangedSubview(timeStackView)
		
		contentStackView.addArrangedSubview(topStackView)
		contentStackView.addArrangedSubview(middleHolderView)
		contentStackView.addArrangedSubview(bottomStackView)
        
        
		
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
			
			workplaceIcon.widthAnchor.constraint(equalToConstant: 36),
			workplaceIcon.heightAnchor.constraint(equalToConstant: 36),
			
			timeIcon.widthAnchor.constraint(equalToConstant: 36),
			timeIcon.heightAnchor.constraint(equalToConstant: 36),
			
			contentStackView.trailingAnchor.constraint(equalTo: holderView.trailingAnchor, constant: -16),
			contentStackView.leadingAnchor.constraint(equalTo: holderView.leadingAnchor, constant: 16),
			contentStackView.topAnchor.constraint(equalTo: holderView.topAnchor, constant: 16),
			contentStackView.bottomAnchor.constraint(equalTo: holderView.bottomAnchor, constant: -16),
			
			middleStackView.trailingAnchor.constraint(equalTo: middleHolderView.trailingAnchor, constant: -16),
			middleStackView.leadingAnchor.constraint(equalTo: middleHolderView.leadingAnchor, constant: 16),
			middleStackView.topAnchor.constraint(equalTo: middleHolderView.topAnchor, constant: 16),
			middleStackView.bottomAnchor.constraint(equalTo: middleHolderView.bottomAnchor, constant: -16),
			
			cancelButton.heightAnchor.constraint(equalToConstant: 48),
			actionButton.heightAnchor.constraint(equalToConstant: 48),
		])
	}

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
