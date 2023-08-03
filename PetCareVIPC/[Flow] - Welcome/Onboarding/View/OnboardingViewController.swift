//
//  OnboardingViewController.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 5.07.2023.
//

import UIKit

protocol OnboardingViewControllerProtocol: AnyObject {
	func display(viewState: OnboardingViewState)
    func displayRulesCheckBox(rulesCheckBoxImage: UIImage)
    func displayRulesCheckBox(newsletterCheckBoxImage: UIImage)
    func displayRulesView()
}

final class OnboardingViewController: UIViewController {

	private let interactor: OnboardingInteractorProtocol
    private var onboardingType: OnboardingViewType?
	init(interactor: OnboardingInteractorProtocol) {
		self.interactor = interactor
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private let customView = OnboardingView()

	override func loadView() {
		view = customView
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		
        customView.actionButton.addTarget(self, action: #selector(didTapActionButton), for: .touchUpInside)
        customView.rulesCheckboxButton.addTarget(self, action: #selector(didTapRulesCheckboxButton), for: .touchUpInside)
        customView.newsletterCheckboxButton.addTarget(self, action: #selector(didTapNewsLetterCheckboxButton), for: .touchUpInside)
        customView.forgetPasswordButton.addTarget(self, action: #selector(didTapForgetPasswordButton), for: .touchUpInside)
		
		interactor.viewDidLoad()
	}
    
    @objc private func didTapRulesCheckboxButton() {
        interactor.didTapRulesCheckboxButton()
    }
    
    @objc private func didTapNewsLetterCheckboxButton() {
        interactor.didTapNewsLetterCheckboxButton()
    }
    
    @objc func didTapForgetPasswordButton() {
        interactor.didTapForgetPasswordButton()
    }

	@objc func didTapActionButton() {
		switch onboardingType {
		case .register:
			interactor.didTapActionButton(
				fullname: customView.fullNameTextField.text,
				email: customView.emailTextField.text,
				password: customView.passwordTextField.text
			)
		case .signIn:
			interactor.didTapActionButton(
				fullname: nil,
				email: customView.emailTextField.text,
				password: customView.passwordTextField.text
			)
		case .none:
			break
		}
		
	}
}

// MARK: - OnboardingViewControllerProtocol
extension OnboardingViewController: OnboardingViewControllerProtocol {

	func display(viewState: OnboardingViewState) {
        switch viewState {
        case .initial(let type, let viewModel, let isRulesCheckboxEnabled):
            customView.headlineLabel.text = viewModel.headlineText
            customView.actionButton.setTitle(viewModel.actionButtonText, for: .normal)
            customView.guiderLabelText = viewModel.guiderLabelText
            customView.guiderButtonText = viewModel.guiderButtonText
            customView.rulesCheckboxButton.setImage(UIImage(named: "disabled")!, for: .normal)
            customView.newsletterCheckboxButton.setImage(UIImage(named: "disabled")!, for: .normal)
            customView.setup()
            customView.rulesLabel.delegate = self
			customView.guiderLabel.delegate = self
            if isRulesCheckboxEnabled {
                customView.rulesCheckboxButton.setImage(UIImage(named: "activated")!, for: .normal)
            }
            switch type {
            case .register:
                self.onboardingType = .register
                customView.registerViewSetup()
            case .signIn:
                self.onboardingType = .signIn
                customView.signInViewSetup()
            }
        case .loading:
            customView.startSpinner()
        case .success:
            customView.stopSpinner()
        case .error(alertViewModel: let alertViewModel):
            displayAlert(alertViewModel)
        }
	}
    
    func displayRulesCheckBox(rulesCheckBoxImage: UIImage) {
        customView.rulesCheckboxButton.setImage(rulesCheckBoxImage, for: .normal)
    }
    
    func displayRulesCheckBox(newsletterCheckBoxImage: UIImage) {
        customView.newsletterCheckboxButton.setImage(newsletterCheckBoxImage, for: .normal)
    }
    
    private func displayAlert(_ viewModel: AlertViewModel) {
        let alert = UIAlertController(title: viewModel.title, message: viewModel.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: viewModel.buttonTitle, style: .default))
        present(alert, animated: true)
    }
    
    func displayRulesView() {
        present(RulesViewController.build(coordinator: self), animated: true)
    }
}

extension OnboardingViewController: RulesInteractorCoordinatorDelegate {
    func didRulesViewFinish(isRulesCheckboxEnabled: Bool) {
        presentedViewController?.presentingViewController?.dismiss(animated: true)
        interactor.didTapRulesCheckboxButton()
    }
    
    
}

extension OnboardingViewController: UITextViewDelegate {
	
	func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
		if URL.scheme == "didTapGuiderButton" {
            interactor.didTapGuiderButton()
		}
        
        if URL.scheme == "didTapRulesButton" {
            interactor.didTapRulesButton()
        }
        
		return false
	}
}
