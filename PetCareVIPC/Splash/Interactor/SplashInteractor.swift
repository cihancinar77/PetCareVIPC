//
//  SplashInteractor.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 4.07.2023.
//

import Foundation

protocol SplashInteractorProtocol: AnyObject {
	func viewDidLoad()
    func didAnimationFinish()
}

protocol SplashInteractorCoordinatorDelegate: AnyObject {
    func didSplashFinish()
}

final class SplashInteractor {

	weak var coordinator: SplashInteractorCoordinatorDelegate?
	private let presenter: SplashPresenterProtocol

	init(presenter: SplashPresenterProtocol) {
		self.presenter = presenter
	}
}

// MARK: - SplashInteractorProtocol
extension SplashInteractor: SplashInteractorProtocol {

	func viewDidLoad() {
		presenter.setupInitialState()
	}
    
    func didAnimationFinish() {
        coordinator?.didSplashFinish()
    }
}
