//
//  ExploreFlowCoordinator.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 10.07.2023.
//

import UIKit

final class ExploreFlowCoordinator: FlowCoordination {
    
	private(set) var navigationController = UINavigationController()
	
    func start() {
        let exploreViewController = ExploreViewController.build(coordinator: self)
        navigationController.viewControllers = [exploreViewController]
		navigationController.tabBarItem = UITabBarItem(title: "Explore", image: UIImage(systemName: "safari"), selectedImage: nil)
    }
}

extension ExploreFlowCoordinator: ExploreInteractorCoordinatorDelegate {
    
}
