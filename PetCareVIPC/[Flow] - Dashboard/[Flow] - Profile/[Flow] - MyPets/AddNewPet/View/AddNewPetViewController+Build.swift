//
//  AddNewPetViewController+Build.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 15.07.2023.
//

import UIKit

extension AddNewPetViewController {

	static func build(coordinator: AddNewPetInteractorCoordinatorDelegate) -> UIViewController {
		let presenter = AddNewPetPresenter()
		let interactor = AddNewPetInteractor(presenter: presenter)
		interactor.coordinator = coordinator
		let viewController = AddNewPetViewController(interactor: interactor)
		presenter.viewController = viewController
		return viewController
	}
}
