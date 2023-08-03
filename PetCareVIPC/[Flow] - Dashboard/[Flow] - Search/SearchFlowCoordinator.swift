//
//  SearchFlowCoordinator.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 10.07.2023.
//

import UIKit
import Swinject

final class SearchFlowCoordinator: FlowCoordination {
    
    private(set) var navigationController = UINavigationController()
    private var childViewController: UIViewController?
	private let resolver: SearchFlowCoordinatorResolver
	
	init(resolver: SearchFlowCoordinatorResolver) {
		self.resolver = resolver
	}
	
    func start() {
		
		let searchViewController = resolver.resolveSearchViewController(coordinator: self)
		navigationController.viewControllers = [searchViewController]
		navigationController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), selectedImage: nil)
    }
}

extension SearchFlowCoordinator: SearchInteractorCoordinatorDelegate {
    func userDidSelectSearchItem() {
            let searchListingViewController = SearchListingViewController.build(coordinator: self)
            childViewController = searchListingViewController
            navigationController.pushViewController(searchListingViewController, animated: true)
    }
}

extension SearchFlowCoordinator: SearchListingInteractorCoordinatorDelegate {
 
    func didTapCloseButton() {
        navigationController.popViewController(animated: true)
    }
    
    func didSelectSpeciality(selectedSpeciality: String, date: Date?) {
        let searchResultsViewController = resolver.resolveSearchResultsViewController(coordinator: self, selectedSpeciality: selectedSpeciality, date: date)
        navigationController.pushViewController(searchResultsViewController, animated: true)
    }
    
}

extension SearchFlowCoordinator: SearchResultsInteractorCoordinatorDelegate {
    
}
