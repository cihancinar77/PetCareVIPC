//
//  RulesView.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 8.07.2023.
//

import UIKit

final class RulesView: UIView {
    
    private let backgroundImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "gradient_background")
        view.contentMode = .scaleAspectFill
        view.contentHuggingPriority(for: .vertical)
        view.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let headlineLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: Fonts.EncodeSans.bold, size: FontSize.h2Headline)
        view.textColor = Colors.lightGrey
        view.textAlignment = .center
        view.text = "Terms and Conditions"
        view.numberOfLines = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let holderView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let rulesTextView: UITextView = {
        let view = UITextView()
        view.showsVerticalScrollIndicator = true
        view.indicatorStyle = .black
        view.contentInsetAdjustmentBehavior = .never
        view.textAlignment = NSTextAlignment.justified
        view.textColor = UIColor.black
        view.backgroundColor = .white
        view.isEditable = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let actionButton: UIButton = {
        let view = UIButton()
        view.titleLabel?.font = UIFont(name: Fonts.EncodeSans.bold, size: FontSize.button)
        view.backgroundColor = Colors.violet
        view.setTitleColor(.white, for: .normal)
        view.contentMode = .center
        view.layer.cornerRadius = 24
        view.setTitle("I understand and agree.", for: .normal)
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
        rulesTextView.text = rulesTextString

        addSubview(backgroundImageView)
        addSubview(headlineLabel)
        addSubview(holderView)
        holderView.addSubview(rulesTextView)
        addSubview(actionButton)
		NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -200),
            
            headlineLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            headlineLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            headlineLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            holderView.topAnchor.constraint(equalTo: headlineLabel.bottomAnchor, constant: 20),
            holderView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            holderView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            holderView.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -40),
            
            rulesTextView.topAnchor.constraint(equalTo: holderView.topAnchor),
            rulesTextView.leadingAnchor.constraint(equalTo: holderView.leadingAnchor, constant: 10),
            rulesTextView.trailingAnchor.constraint(equalTo: holderView.trailingAnchor, constant: -10),
            rulesTextView.bottomAnchor.constraint(equalTo: holderView.bottomAnchor),
            
            actionButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            actionButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            actionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            actionButton.heightAnchor.constraint(equalToConstant: 48)
		])
	}
}
