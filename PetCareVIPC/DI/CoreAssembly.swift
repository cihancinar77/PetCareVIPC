//
//  CoreAssembly.swift
//  PetCareVIPC
//
//  Created by Serdar Y on 28/07/2023.
//

import Foundation
import Swinject

class CoreAssembly: Assembly {
	
	func assemble(container: Container) {
		
		container.register(NetworkServiceProtocol.self) { _ in
			NetworkService()
		}
		
	}
}
