//
//  RulesInteractor.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 8.07.2023.
//

import Foundation

protocol RulesInteractorProtocol: AnyObject {
	func viewDidLoad()
    func textViewScrollDidEndDragging()
    func didTapActionButton()
    
}

protocol RulesInteractorCoordinatorDelegate: AnyObject {
    func didRulesViewFinish(isRulesCheckboxEnabled: Bool)
}

final class RulesInteractor {

    var isTextRead = false
	weak var coordinator: RulesInteractorCoordinatorDelegate?
	private let presenter: RulesPresenterProtocol

	init(presenter: RulesPresenterProtocol) {
		self.presenter = presenter
	}
}

// MARK: - RulesInteractorProtocol
extension RulesInteractor: RulesInteractorProtocol {

	func viewDidLoad() {
        presenter.setupInitialState(isTextRead: isTextRead)
	}
    
    func textViewScrollDidEndDragging() {
        isTextRead = true
        presenter.setupInitialState(isTextRead: isTextRead)
    }
    
    func didTapActionButton() {
        coordinator?.didRulesViewFinish(isRulesCheckboxEnabled: isTextRead)
    }
}
