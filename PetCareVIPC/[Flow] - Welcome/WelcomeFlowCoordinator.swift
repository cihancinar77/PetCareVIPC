//
//  WelcomeFlowCoordinator.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 4.07.2023.
//

import UIKit

protocol WelcomeFlowCoordinatorDelegate: AnyObject {
    func didOnboardingFinish()
}

class WelcomeFlowCoordinator: FlowCoordination {
    
    weak var delegate: WelcomeFlowCoordinatorDelegate?
    private let navigationController = UINavigationController()
    private let window: UIWindow
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let welcomeViewController = WelcomeViewController.build(coordinator: self)
        navigationController.viewControllers = [welcomeViewController]
        window.rootViewController = navigationController
    }
    
    private func startOnboardingViewController(type: OnboardingViewType, isRulesCheckboxEnabled: Bool) {
        let onboardingViewController = OnboardingViewController.build(coordinator: self, type: type)
        navigationController.present(onboardingViewController, animated: true)
    }
}

extension WelcomeFlowCoordinator: WelcomeInteractorCoordinatorDelegate {
    
    func userWantsToRegister() {
        startOnboardingViewController(type: .register, isRulesCheckboxEnabled: false)
    }
    
    func userWantsToSignUp() {
        startOnboardingViewController(type: .signIn, isRulesCheckboxEnabled: true)
    }
}

extension WelcomeFlowCoordinator: OnboardingInteractorCoordinatorDelegate {
    
    func showRegistration() {
        navigationController.dismiss(animated: true)
        startOnboardingViewController(type: .register, isRulesCheckboxEnabled: false)
    }
    
    func showSignIn() {
        navigationController.dismiss(animated: true)
        startOnboardingViewController(type: .signIn, isRulesCheckboxEnabled: true)
    }
    
    func showForgetPasswordViewController() {
        print("ViewController for resetting password")
    }
    
    func userRegisteredSuccessfully() {
        delegate?.didOnboardingFinish()
        print(delegate)
    }
    
    func didLoginFinish() {
        delegate?.didOnboardingFinish()
    }
}

