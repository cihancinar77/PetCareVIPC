//
//  RulesViewController+Build.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 8.07.2023.
//

import UIKit

extension RulesViewController {

	static func build(coordinator: RulesInteractorCoordinatorDelegate) -> UIViewController {
		let presenter = RulesPresenter()
		let interactor = RulesInteractor(presenter: presenter)
		interactor.coordinator = coordinator
		let viewController = RulesViewController(interactor: interactor)
		presenter.viewController = viewController
		return viewController
	}
}
