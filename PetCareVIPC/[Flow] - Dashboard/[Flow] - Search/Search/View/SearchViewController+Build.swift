//
//  SearchViewController+Build.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 10.07.2023.
//

import UIKit
import Swinject

extension SearchViewController {

	static func build(
		coordinator: SearchInteractorCoordinatorDelegate,
		searchService: SearchServiceProtocol
	) -> UIViewController {
		
		let presenter = SearchPresenter()
		let interactor = SearchInteractor(presenter: presenter, searchService: searchService)
		interactor.coordinator = coordinator
		let viewController = SearchViewController(interactor: interactor)
		presenter.viewController = viewController
		return viewController
	}
}
