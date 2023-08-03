//
//  SearchFlowCoordinator+Build.swift
//  PetCareVIPC
//
//  Created by Serdar Y on 28/07/2023.
//

import Foundation
import Swinject

extension SearchFlowCoordinator {
	static func build(container: Container) -> SearchFlowCoordinator {
		let resolver = SearchFlowCoordinatorModule(parent: container)
		return SearchFlowCoordinator(resolver: resolver)
	}
}
