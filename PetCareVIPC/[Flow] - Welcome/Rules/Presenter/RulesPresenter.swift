//
//  RulesPresenter.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 8.07.2023.
//

import UIKit

protocol RulesPresenterProtocol: AnyObject {
	func setupInitialState(isTextRead: Bool)
}

final class RulesPresenter: RulesPresenterProtocol {

	weak var viewController: RulesViewControllerProtocol?

	func setupInitialState(isTextRead: Bool) {
		viewController?.display(viewState: .initial(isTextRead: isTextRead))
	}
}
