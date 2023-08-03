//
//  WelcomeViewController.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 4.07.2023.
//

import UIKit

protocol WelcomeViewControllerProtocol: AnyObject {
	func display(viewState: WelcomeViewState)
}

final class WelcomeViewController: UIViewController {

	private let interactor: WelcomeInteractorProtocol

	init(interactor: WelcomeInteractorProtocol) {
		self.interactor = interactor
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private let customView = WelcomeView()

	override func loadView() {
		view = customView
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		interactor.viewDidLoad()
        customView.registerButton.addTarget(self, action: #selector(didTapRegisterButton), for: .touchUpInside)
        customView.signInButton.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
	}
    
    @objc func didTapRegisterButton() {
        interactor.didTapRegisterButton()
    }
    
    @objc func didTapSignInButton() {
        interactor.didTapSignInButton()
    }
}

// MARK: - WelcomeViewControllerProtocol
extension WelcomeViewController: WelcomeViewControllerProtocol {

	func display(viewState: WelcomeViewState) {
		switch viewState {
		case .initial:
			break
		}
	}
}
