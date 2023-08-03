//
//  ProfileViewController+Build.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 10.07.2023.
//

import UIKit

extension ProfileViewController {

	static func build(coordinator: ProfileInteractorCoordinatorDelegate) -> UIViewController {
		let presenter = ProfilePresenter()
		let interactor = ProfileInteractor(presenter: presenter)
		interactor.coordinator = coordinator
		let viewController = ProfileViewController(interactor: interactor)
		presenter.viewController = viewController
		return viewController
	}
}
