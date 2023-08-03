//
//  DashboardFlowCoordinator.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 10.07.2023.
//

import UIKit
import Swinject

final class DashboardFlowCoordinator: NSObject, FlowCoordination {
    
    private var childFlowCoordinators: [FlowCoordination] = []
	
    private let window: UIWindow
    private let tabBarController = UITabBarController()
	private let container: Container
	
	init(window: UIWindow, container: Container) {
        self.window = window
		self.container = container
    }
	
    func start() {
        
		let searchCoordinator = SearchFlowCoordinator.build(container: container)
        childFlowCoordinators.append(searchCoordinator)
        
        let appointmentsCoordinator = AppointmentsFlowCoordinator()
        childFlowCoordinators.append(appointmentsCoordinator)
        
        let exploreCoordinator = ExploreFlowCoordinator()
        childFlowCoordinators.append(exploreCoordinator)
        
		let profileCoordinator = ProfileFlowCoordinator()
		childFlowCoordinators.append(profileCoordinator)
		
		tabBarController.tabBar.isTranslucent = false
		tabBarController.tabBar.backgroundColor = .white
		tabBarController.delegate = self
		
		tabBarController.viewControllers = [
            searchCoordinator.navigationController,
            appointmentsCoordinator.navigationController,
            exploreCoordinator.navigationController,
            profileCoordinator.navigationController
		]

        let separatorView = UIView(frame: CGRect(x: 0, y: -2, width: tabBarController.tabBar.frame.width, height: 2))
        separatorView.backgroundColor = Colors.lightGrey
        tabBarController.tabBar.addSubview(separatorView)
		
		self.window.rootViewController = tabBarController
		
		for coordinator in childFlowCoordinators {
			coordinator.start()
		}
    }
}

extension DashboardFlowCoordinator: UITabBarControllerDelegate {
}
