//
//  MyPetsViewController+Build.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 14.07.2023.
//

import UIKit

extension MyPetsViewController {

	static func build(coordinator: MyPetsInteractorCoordinatorDelegate) -> UIViewController {
		let presenter = MyPetsPresenter()
		let interactor = MyPetsInteractor(presenter: presenter)
		interactor.coordinator = coordinator
		let viewController = MyPetsViewController(interactor: interactor)
		presenter.viewController = viewController
		return viewController
	}
}
