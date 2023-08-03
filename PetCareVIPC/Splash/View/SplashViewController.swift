//
//  SplashViewController.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 4.07.2023.
//

import UIKit

protocol SplashViewControllerProtocol: AnyObject {
	func display(viewState: SplashViewState)
}

final class SplashViewController: UIViewController {

	private let interactor: SplashInteractorProtocol

	init(interactor: SplashInteractorProtocol) {
		self.interactor = interactor
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private let customView = SplashView()

	override func loadView() {
		view = customView
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		interactor.viewDidLoad()
	}
}

// MARK: - SplashViewControllerProtocol
extension SplashViewController: SplashViewControllerProtocol {

	func display(viewState: SplashViewState) {
		switch viewState {
		case .initial:
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
				self.interactor.didAnimationFinish()
			}
		}
	}
}
