//
//  TutorialsPresenter.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 4.07.2023.
//

import UIKit

protocol TutorialsPresenterProtocol: AnyObject {
    func setupInitialState(data: [TutorialsViewModel])
	func updateScreen(data: TutorialsViewModel, isLastItem: Bool, pageIndex: Int)
}

final class TutorialsPresenter: TutorialsPresenterProtocol {

	weak var viewController: TutorialsViewControllerProtocol?

	func setupInitialState(data: [TutorialsViewModel]) {
        viewController?.display(viewState: .initial(data: data))
	}
	
	func updateScreen(data: TutorialsViewModel, isLastItem: Bool, pageIndex: Int) {
		viewController?.updateScreen(
			title: data.headline,
			subtitle: data.body,
			buttonText: isLastItem ? "Get Started" : "Next",
			pageIndex: pageIndex
		)
	}
}
