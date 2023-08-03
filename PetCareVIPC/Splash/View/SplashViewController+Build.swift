//
//  SplashViewController+Build.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 4.07.2023.
//

import UIKit

extension SplashViewController {

	static func build(coordinator: SplashInteractorCoordinatorDelegate) -> UIViewController {
		let presenter = SplashPresenter()
		let interactor = SplashInteractor(presenter: presenter)
		interactor.coordinator = coordinator
		let viewController = SplashViewController(interactor: interactor)
		presenter.viewController = viewController
		return viewController
	}
}
