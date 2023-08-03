//
//  SearchResultsViewController+Build.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 24.07.2023.
//

import UIKit

extension SearchResultsViewController {

    static func build(searchService: SearchServiceProtocol, coordinator: SearchResultsInteractorCoordinatorDelegate, selectedSpeciality: String, date: Date?) -> UIViewController {
		let presenter = SearchResultsPresenter()
        let interactor = SearchResultsInteractor(searchService: searchService, selectedSpeciality: selectedSpeciality, date: date, presenter: presenter)
		interactor.coordinator = coordinator
		let viewController = SearchResultsViewController(interactor: interactor)
		presenter.viewController = viewController
		return viewController
	}
}
