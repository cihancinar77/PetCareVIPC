//
//  ExploreInteractor.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 10.07.2023.
//

import Foundation

protocol ExploreInteractorProtocol: AnyObject {
	func viewDidLoad()
}

protocol ExploreInteractorCoordinatorDelegate: AnyObject {

}

final class ExploreInteractor {

	weak var coordinator: ExploreInteractorCoordinatorDelegate?
	private let presenter: ExplorePresenterProtocol

	init(presenter: ExplorePresenterProtocol) {
		self.presenter = presenter
	}
}

// MARK: - ExploreInteractorProtocol
extension ExploreInteractor: ExploreInteractorProtocol {

	func viewDidLoad() {
		presenter.setupInitialState()
	}
}
