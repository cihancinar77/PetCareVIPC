//
//  AppointmentsFlowCoordinator.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 10.07.2023.
//

import UIKit

final class AppointmentsFlowCoordinator: FlowCoordination {
	
	private(set) var navigationController = UINavigationController()

    func start() {
        let appointmentsViewController = AppointmentsViewController.build(coordinator: self)
		navigationController.viewControllers = [appointmentsViewController]
		navigationController.tabBarItem = UITabBarItem(title: "Appointments", image: UIImage(systemName: "clock"), selectedImage: nil)
    }
}

extension AppointmentsFlowCoordinator: AppointmentsInteractorCoordinatorDelegate {
    
}


