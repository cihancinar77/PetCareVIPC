//
//  ProfileFlowCoordinator.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 10.07.2023.
//

import UIKit

final class ProfileFlowCoordinator: FlowCoordination {
    
    private var childCoordinators: [FlowCoordination] = []
	private(set) var navigationController = UINavigationController()
	
    func start() {
        let profileViewController = ProfileViewController.build(coordinator: self)
		navigationController.viewControllers = [profileViewController]
        
        let myPetsFlowCoordinator = MyPetsFlowCoordinator(navigationController: navigationController)
        childCoordinators.append(myPetsFlowCoordinator)
		
		navigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), selectedImage: nil)
    }
}

extension ProfileFlowCoordinator: ProfileInteractorCoordinatorDelegate {
    func didProfileMenuSelectionFinish(index: Int) {
        if index <= childCoordinators.count - 1 {
            childCoordinators[index].start()
        }
    }
}

