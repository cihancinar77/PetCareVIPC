//
//  ExploreViewController.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 10.07.2023.
//

import UIKit

protocol ExploreViewControllerProtocol: AnyObject {
	func display(viewState: ExploreViewState)
}

final class ExploreViewController: UIViewController {

	private let interactor: ExploreInteractorProtocol

	init(interactor: ExploreInteractorProtocol) {
		self.interactor = interactor
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private let customView = ExploreView()

	override func loadView() {
		view = customView
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		interactor.viewDidLoad()
	}
}

// MARK: - ExploreViewControllerProtocol
extension ExploreViewController: ExploreViewControllerProtocol {

	func display(viewState: ExploreViewState) {
		switch viewState {
		case .initial:
			break
		}
	}
}
