//
//  SearchFlowCoordinatorModule.swift
//  PetCareVIPC
//
//  Created by Serdar Y on 28/07/2023.
//

import Foundation
import Swinject

protocol SearchFlowCoordinatorResolver {

	func resolveSearchViewController(coordinator: SearchInteractorCoordinatorDelegate) -> UIViewController
    
    func resolveSearchResultsViewController(coordinator: SearchResultsInteractorCoordinatorDelegate, selectedSpeciality: String, date: Date?) -> UIViewController
}

class SearchFlowCoordinatorModule: SearchFlowCoordinatorResolver {
	
	private let resolver: Resolver
	private let container: Container
	
	init(parent: Container) {
		
		self.container = Container(parent: parent)
		
		let searchAssembly = SearchAssembly()
		searchAssembly.assemble(container: container)
		
		let assemblies: [Assembly] = [searchAssembly]
		_ = Assembler(assemblies, container: container)
		
		self.resolver = container
	}
	
	func resolveSearchViewController(coordinator: SearchInteractorCoordinatorDelegate) -> UIViewController {
		
		let searchService = resolver.resolve(SearchServiceProtocol.self)!
		
		let searchViewController = SearchViewController.build(coordinator: coordinator, searchService: searchService)
		return searchViewController
	}
    
    func resolveSearchResultsViewController(
        coordinator: SearchResultsInteractorCoordinatorDelegate,
        selectedSpeciality: String,
        date: Date?
    ) -> UIViewController {
        let searchService = resolver.resolve(SearchServiceProtocol.self)!
        let searchResultsViewController = SearchResultsViewController.build(
            searchService: searchService,
            coordinator: coordinator,
            selectedSpeciality: selectedSpeciality,
            date: date
        )
        return searchResultsViewController
    }
}
