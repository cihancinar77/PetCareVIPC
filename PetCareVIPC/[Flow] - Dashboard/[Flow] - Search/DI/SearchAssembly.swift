//
//  SearchAssembly.swift
//  PetCareVIPC
//
//  Created by Serdar Y on 28/07/2023.
//

import Foundation
import Swinject

class SearchAssembly: Assembly {
	
	func assemble(container: Container) {
		container.register(SearchServiceProtocol.self) { resolver in
			let networkService = resolver.resolve(NetworkServiceProtocol.self)!
			return SearchService(networkService: networkService)
		}
	}
}
