//
//  OnboardingView.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 5.07.2023.
//

import UIKit

final class OnboardingView: UIView {
    
    var guiderLabelText = ""
    var guiderButtonText = ""
    
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
        view.font = UIFont(name: Fonts.EncodeSans.bold, size: FontSize.h1Headline)
        view.textColor = Colors.lightGrey
        view.textAlignment = .left
        view.numberOfLines = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
	
	private let stackViewHolder: UIView = {
		let view = UIView()
		view.backgroundColor = Colors.lightGrey
		view.layer.cornerRadius = 10
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
    
    private let mainStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .fill
        view.spacing = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let textFieldStackView: UIStackView = {
        let view = UIStackView()
        view.alignment = .fill
        view.distribution = .fill
        view.axis = .vertical
        view.spacing = 12
        return view
    }()
    
    let fullNameTextField: UITextField = {
        let view = UITextField()
        view.backgroundColor = .white
        view.autocorrectionType = .no
        view.autocapitalizationType = .none
        view.layer.cornerRadius = 10
        view.placeholder = "Full name"
        view.textAlignment = .center
        view.textColor = .black
        view.setPlaceholderTextColor(.darkGray)
        return view
    }()
    
    let emailTextField: UITextField = {
        let view = UITextField()
        view.backgroundColor = .white
        view.autocorrectionType = .no
        view.autocapitalizationType = .none
        view.layer.cornerRadius = 10
        view.placeholder = "Email"
        view.textAlignment = .center
        view.textColor = .black
        view.setPlaceholderTextColor(.darkGray)
        return view
    }()
    
    let passwordTextField: UITextField = {
        let view = UITextField()
        view.autocorrectionType = .no
        view.autocapitalizationType = .none
        view.isSecureTextEntry = true
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.placeholder = "Password"
        view.textAlignment = .center
        view.textColor = .black
        view.setPlaceholderTextColor(.darkGray)
        return view
    }()
    
    private let checkboxStackView: UIStackView = {
        let view = UIStackView()
        view.alignment = .fill
        view.distribution = .fill
        view.axis = .vertical
        view.spacing = 8
        return view
    }()
    
    private let rulesStackView: UIStackView = {
        let view = UIStackView()
        view.alignment = .center
        view.distribution = .fill
        view.axis = .horizontal
        view.spacing = 8
        return view
    }()
    
    let rulesCheckboxButton = UIButton()
   
    let rulesLabel: UITextView = {
        let view = UITextView()
        view.font = UIFont(name: Fonts.EncodeSans.regular, size: FontSize.body1)
        view.textColor = Colors.black
        view.isEditable = false
        view.isScrollEnabled = false
        view.backgroundColor = .clear
        let attributedString = NSMutableAttributedString(string: "I agree with the rules")
        
        attributedString.addAttributes([
            .link: "didTapRulesButton://",
            .foregroundColor: Colors.violet!,
            .underlineStyle: NSUnderlineStyle.thick.rawValue,
            .font: UIFont(name: Fonts.EncodeSans.regular, size: FontSize.body3)!
        ], range: (attributedString.string as NSString).range(of: "the rules"))
        
        attributedString.addAttributes([
            .foregroundColor: Colors.black!,
            .font: UIFont(name: Fonts.EncodeSans.regular, size: FontSize.body3)!
        ], range: (attributedString.string as NSString).range(of: "I agree with"))
        
        view.attributedText = attributedString
        view.textAlignment = .left
        return view
    }()
    
    private let newsletterStackView: UIStackView = {
        let view = UIStackView()
        view.alignment = .center
        view.distribution = .fill
        view.axis = .horizontal
        view.spacing = 8
        return view
    }()
    
    let newsletterCheckboxButton = UIButton()
    
    let newsletterLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: Fonts.EncodeSans.regular, size: FontSize.body3)
        view.textColor = Colors.black
        view.textAlignment = .left
        view.numberOfLines = 1
        view.text = "I do not want to recieve newsletter"
        return view
    }()
    
    let forgetPasswordButton: UIButton = {
        let view = UIButton()
        view.titleLabel?.font = UIFont(name: Fonts.EncodeSans.regular, size: FontSize.body3)
        view.setTitleColor(Colors.violet, for: .normal)
        view.backgroundColor = .clear
        view.contentMode = .right
        view.setTitle("Do not remember the password?", for: .normal)
        view.titleLabel?.textAlignment = .right
        return view
    }()
    
    let actionButton: UIButton = {
        let view = UIButton()
        view.titleLabel?.font = UIFont(name: Fonts.EncodeSans.bold, size: FontSize.button)
        view.backgroundColor = Colors.violet
        view.setTitleColor(.white, for: .normal)
        view.contentMode = .center
        view.layer.cornerRadius = 24
        return view
    }()
    
    private let guiderStackView: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = .clear
        view.axis = .horizontal
		view.alignment = .center
        view.distribution = .fill
        view.spacing = 3
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var guiderLabel: UITextView = {
        let view = UITextView()
        view.font = UIFont(name: Fonts.EncodeSans.regular, size: FontSize.body1)
        view.textColor = Colors.black
        view.isEditable = false
		view.isScrollEnabled = false
		view.backgroundColor = .clear
    
        lazy var attributedString = NSMutableAttributedString(string: "\(self.guiderLabelText)\(self.guiderButtonText)")
		
		attributedString.addAttributes([
			.link: "didTapGuiderButton://",
			.foregroundColor: Colors.violet!,
			.font: UIFont(name: Fonts.EncodeSans.bold, size: FontSize.button)!
		], range: (attributedString.string as NSString).range(of: guiderButtonText))
		
		attributedString.addAttributes([
			.foregroundColor: Colors.black!,
			.font: UIFont(name: Fonts.EncodeSans.regular, size: FontSize.body1)!
		], range: (attributedString.string as NSString).range(of: guiderLabelText))
		
		view.attributedText = attributedString
        view.textAlignment = .center
        return view
    }()
    
    let guiderButton: UIButton = {
        let view = UIButton()
        view.titleLabel?.font = UIFont(name: Fonts.EncodeSans.bold, size: FontSize.button)
        view.setTitleColor(Colors.violet, for: .normal)
        view.backgroundColor = .clear
        view.contentMode = .left
        view.titleLabel?.textAlignment = .left
        return view
    }()
    
    let spinner: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.color = Colors.violet
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startSpinner() {
        spinner.isHidden = false
        spinner.startAnimating()
    }
    
    func stopSpinner() {
        spinner.isHidden = true
        spinner.stopAnimating()
    }
    
    func registerViewSetup() {
		addSubview(headlineLabel)
		
		addSubview(stackViewHolder)
		stackViewHolder.addSubview(mainStackView)
		
        mainStackView.addArrangedSubview(textFieldStackView)
        mainStackView.addArrangedSubview(checkboxStackView)
        mainStackView.addArrangedSubview(actionButton)
        
        textFieldStackView.addArrangedSubview(fullNameTextField)
        textFieldStackView.addArrangedSubview(emailTextField)
        textFieldStackView.addArrangedSubview(passwordTextField)
        
        checkboxStackView.addArrangedSubview(rulesStackView)
        checkboxStackView.addArrangedSubview(newsletterStackView)
        rulesStackView.addArrangedSubview(rulesCheckboxButton)
        rulesStackView.addArrangedSubview(rulesLabel)
        newsletterStackView.addArrangedSubview(newsletterCheckboxButton)
        newsletterStackView.addArrangedSubview(newsletterLabel)
        addSubview(spinner)
        
        NSLayoutConstraint.activate([
            
            headlineLabel.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            headlineLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            headlineLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
			
			stackViewHolder.topAnchor.constraint(equalTo: headlineLabel.bottomAnchor, constant: 30),
			stackViewHolder.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
			stackViewHolder.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
			stackViewHolder.bottomAnchor.constraint(lessThanOrEqualTo: guiderStackView.topAnchor, constant: -40),
			
			mainStackView.topAnchor.constraint(equalTo: stackViewHolder.topAnchor, constant: 30),
			mainStackView.leadingAnchor.constraint(equalTo: stackViewHolder.leadingAnchor, constant: 20),
			mainStackView.trailingAnchor.constraint(equalTo: stackViewHolder.trailingAnchor, constant: -20),
			mainStackView.bottomAnchor.constraint(equalTo: stackViewHolder.bottomAnchor, constant: -35),
			
			fullNameTextField.heightAnchor.constraint(equalToConstant: 40),
			emailTextField.heightAnchor.constraint(equalToConstant: 40),
			passwordTextField.heightAnchor.constraint(equalToConstant: 40),
			actionButton.heightAnchor.constraint(equalToConstant: 46),
            checkboxStackView.heightAnchor.constraint(equalToConstant: 55),
            rulesCheckboxButton.widthAnchor.constraint(equalToConstant: 18),
            rulesCheckboxButton.heightAnchor.constraint(equalToConstant: 18),
            newsletterCheckboxButton.widthAnchor.constraint(equalToConstant: 18),
            newsletterCheckboxButton.heightAnchor.constraint(equalToConstant: 18),
            
			backgroundImageView.bottomAnchor.constraint(equalTo: stackViewHolder.bottomAnchor, constant: -70),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func signInViewSetup() {
        addSubview(headlineLabel)
        
        addSubview(stackViewHolder)
        stackViewHolder.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(textFieldStackView)
        mainStackView.addArrangedSubview(forgetPasswordButton)
        mainStackView.addArrangedSubview(actionButton)
        
        textFieldStackView.addArrangedSubview(emailTextField)
        textFieldStackView.addArrangedSubview(passwordTextField)
        addSubview(spinner)
        
        NSLayoutConstraint.activate([
            
            headlineLabel.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            headlineLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            headlineLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            stackViewHolder.topAnchor.constraint(equalTo: headlineLabel.bottomAnchor, constant: 30),
            stackViewHolder.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackViewHolder.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stackViewHolder.bottomAnchor.constraint(lessThanOrEqualTo: guiderStackView.topAnchor, constant: -40),
            
            mainStackView.topAnchor.constraint(equalTo: stackViewHolder.topAnchor, constant: 30),
            mainStackView.leadingAnchor.constraint(equalTo: stackViewHolder.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: stackViewHolder.trailingAnchor, constant: -20),
            mainStackView.bottomAnchor.constraint(equalTo: stackViewHolder.bottomAnchor, constant: -35),
            
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            actionButton.heightAnchor.constraint(equalToConstant: 46),
            
            backgroundImageView.bottomAnchor.constraint(equalTo: stackViewHolder.bottomAnchor, constant: -70),
            
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
     func setup() {
        backgroundColor = Colors.pageGrey
        addSubview(backgroundImageView)
        addSubview(guiderStackView)
        guiderStackView.addArrangedSubview(guiderLabel)
		
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
			
            guiderStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            guiderStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            guiderStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -60)
        ])
    }
}
