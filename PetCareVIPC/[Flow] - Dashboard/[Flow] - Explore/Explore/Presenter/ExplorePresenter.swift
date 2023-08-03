//
//  ExplorePresenter.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 10.07.2023.
//

import UIKit

protocol ExplorePresenterProtocol: AnyObject {
	func setupInitialState()
}

final class ExplorePresenter: ExplorePresenterProtocol {

	weak var viewController: ExploreViewControllerProtocol?

	func setupInitialState() {
		viewController?.display(viewState: .initial)
	}
}
