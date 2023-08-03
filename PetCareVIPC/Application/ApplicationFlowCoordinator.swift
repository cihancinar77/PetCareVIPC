//
//  ApplicationFlowCoordinator.swift
//  matchingGameVIPC
//
//  Created by Cihan Cinar on 2.07.2023.
//

import UIKit
import Swinject

final class ApplicationFlowCoordinator: FlowCoordination {
    
    private var childFlowCoordinator: FlowCoordination?
    private var splashViewController: UIViewController?
    private let window: UIWindow
	private let container: Container
	
	init(window: UIWindow, container: Container) {
		self.window = window
		self.container = container
	}
    
    func start() {
        let splashViewController = SplashViewController.build(coordinator: self)
		self.splashViewController = splashViewController
        window.rootViewController = splashViewController
    }
    
    private func startTutorialsFlowCoordinator() {
        let tutorialsFlowCoordinator = TutorialsFlowCoordinator(window: window)
        childFlowCoordinator = tutorialsFlowCoordinator
        tutorialsFlowCoordinator.delegate = self
        childFlowCoordinator?.start()
    }
    
    private func startWelcomeFlowCoordinator() {
        let welcomeFlowCoordinator = WelcomeFlowCoordinator(window: window)
        welcomeFlowCoordinator.delegate = self
        childFlowCoordinator = welcomeFlowCoordinator
        childFlowCoordinator?.start()
    }
	
	private func startDashboardFlowCoordinator() {
        let dashboardFlowCoordinator = DashboardFlowCoordinator(window: window, container: container)
        dashboardFlowCoordinator.start()
		childFlowCoordinator = dashboardFlowCoordinator
	}
	
	@objc private func didTapLogoutButton() {
		UserDefaults.standard.removeObject(forKey: "loggedInUser")
		UserDefaults.standard.synchronize()
		startWelcomeFlowCoordinator()
	}
}

// MARK: - SplashInteractorCoordinatorDelegate
extension ApplicationFlowCoordinator: SplashInteractorCoordinatorDelegate {
    func didSplashFinish() {
		splashViewController = nil
		
		if UserDefaults.standard.value(forKey: "loggedInUser") != nil {
            startDashboardFlowCoordinator()
		} else {
			if UserDefaults.standard.bool(forKey: "isTutorialsFinished") {
				startWelcomeFlowCoordinator()
			} else {
				startTutorialsFlowCoordinator()
			}
		}
    }
}

// MARK: - TutorialsFlowCoordinatorDelegate
extension ApplicationFlowCoordinator: TutorialsFlowCoordinatorDelegate {
    
    func tutorialsFlowCoordinatorDidDelegateFinish() {
        childFlowCoordinator = nil
		startWelcomeFlowCoordinator()
    }
}

// MARK: - WelcomeFlowCoordinatorDelegate
extension ApplicationFlowCoordinator: WelcomeFlowCoordinatorDelegate {

    func didOnboardingFinish() {
        childFlowCoordinator = nil
        startDashboardFlowCoordinator()
    }
}

