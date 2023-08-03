//
//  WelcomeInteractor.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 4.07.2023.
//

import Foundation

protocol WelcomeInteractorProtocol: AnyObject {
	func viewDidLoad()
    func didTapRegisterButton()
    func didTapSignInButton()
}

protocol WelcomeInteractorCoordinatorDelegate: AnyObject {
    func userWantsToRegister()
    func userWantsToSignUp()
}

final class WelcomeInteractor {

	weak var coordinator: WelcomeInteractorCoordinatorDelegate?
	private let presenter: WelcomePresenterProtocol

	init(presenter: WelcomePresenterProtocol) {
		self.presenter = presenter
	}
}

// MARK: - WelcomeInteractorProtocol
extension WelcomeInteractor: WelcomeInteractorProtocol {

	func viewDidLoad() {
		presenter.setupInitialState()
	}
    
    func didTapRegisterButton() {
        coordinator?.userWantsToRegister()
    }
    
    func didTapSignInButton() {
        coordinator?.userWantsToSignUp()
    }
}
