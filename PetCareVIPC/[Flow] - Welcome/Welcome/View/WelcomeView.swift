//
//  WelcomeView.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 4.07.2023.
//

import UIKit

final class WelcomeView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let backgroundImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "gradient_background")
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let headlineLabel: UILabel = {
        let view = UILabel()
        let attributedText = NSMutableAttributedString(string: "Welcome to Pet Care")
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white, range: NSRange(location: 0, length: 10))
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: Colors.yellow, range: NSRange(location: 11, length: 8))
        view.attributedText = attributedText
        view.font = UIFont(name: Fonts.EncodeSans.bold, size: 44)
        view.textAlignment = .left
        view.numberOfLines = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let registerButton: UIButton = {
        let view = UIButton()
        view.setTitle("Register with Email", for: .normal)
        view.titleLabel?.font = UIFont(name: Fonts.EncodeSans.bold, size: FontSize.button)
        view.backgroundColor = .clear
        view.setTitleColor(.white, for: .normal)
        view.contentMode = .center
        view.layer.cornerRadius = 24
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let signInButton: UIButton = {
        let view = UIButton()
        let attributedText = NSMutableAttributedString(string: "Already have an account? Sign In")
        let firstFont = UIFont(name: Fonts.EncodeSans.regular, size: FontSize.body1)
        attributedText.addAttribute(NSAttributedString.Key.font, value: firstFont, range: NSRange(location: 0, length: 24))
        let secondFont = UIFont(name: Fonts.EncodeSans.bold, size: FontSize.button)
        attributedText.addAttribute(NSAttributedString.Key.font, value: secondFont, range: NSRange(location: 25, length: 7))
        view.setAttributedTitle(attributedText, for: .normal)
        view.backgroundColor = .clear
        view.setTitleColor(.white, for: .normal)
        view.contentMode = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()


	private func setup() {
        addSubview(backgroundImageView)
        addSubview(headlineLabel)
        addSubview(registerButton)
        addSubview(signInButton)
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            headlineLabel.topAnchor.constraint(equalTo: topAnchor, constant: 85),
            headlineLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            headlineLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
       
            registerButton.widthAnchor.constraint(equalToConstant: 295),
            registerButton.heightAnchor.constraint(equalToConstant: 46),
            registerButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            registerButton.bottomAnchor.constraint(equalTo: signInButton.topAnchor, constant: -20),
            
            signInButton.widthAnchor.constraint(equalToConstant: 240),
            signInButton.heightAnchor.constraint(equalToConstant: 24),
            signInButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            signInButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60)
		])
	}
}
