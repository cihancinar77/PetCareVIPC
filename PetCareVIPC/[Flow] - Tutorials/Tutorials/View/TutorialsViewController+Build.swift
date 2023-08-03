//
//  TutorialsViewController+Build.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 4.07.2023.
//

import UIKit

extension TutorialsViewController {

	static func build(coordinator: TutorialsInteractorCoordinatorDelegate) -> UIViewController {
		let presenter = TutorialsPresenter()
		let interactor = TutorialsInteractor(presenter: presenter)
		interactor.coordinator = coordinator
		let viewController = TutorialsViewController(interactor: interactor)
		presenter.viewController = viewController
		return viewController
	}
}
