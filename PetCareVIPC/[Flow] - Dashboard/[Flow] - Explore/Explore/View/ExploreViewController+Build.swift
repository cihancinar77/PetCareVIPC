//
//  ExploreViewController+Build.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 10.07.2023.
//

import UIKit

extension ExploreViewController {

	static func build(coordinator: ExploreInteractorCoordinatorDelegate) -> UIViewController {
		let presenter = ExplorePresenter()
		let interactor = ExploreInteractor(presenter: presenter)
		interactor.coordinator = coordinator
		let viewController = ExploreViewController(interactor: interactor)
		presenter.viewController = viewController
		return viewController
	}
}
