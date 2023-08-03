//
//  OnboardingViewController+Build.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 5.07.2023.
//

import UIKit

extension OnboardingViewController {

    static func build(
        coordinator: OnboardingInteractorCoordinatorDelegate, type: OnboardingViewType) -> UIViewController {
		let presenter = OnboardingPresenter()
        let interactor = OnboardingInteractor(presenter: presenter, onboardingViewType: type)
		interactor.coordinator = coordinator
            let viewController = OnboardingViewController(interactor: interactor)
		presenter.viewController = viewController
		return viewController
	}
}
