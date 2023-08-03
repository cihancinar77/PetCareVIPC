//
//  RulesViewController.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 8.07.2023.
//

import UIKit

protocol RulesViewControllerProtocol: AnyObject {
	func display(viewState: RulesViewState)
}

final class RulesViewController: UIViewController {

	private let interactor: RulesInteractorProtocol

	init(interactor: RulesInteractorProtocol) {
		self.interactor = interactor
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private let customView = RulesView()

	override func loadView() {
		view = customView
	}

	override func viewDidLoad() {
		super.viewDidLoad()
        customView.rulesTextView.delegate = self
        customView.actionButton.addTarget(self, action: #selector(didTapActionButton), for: .touchUpInside)
		interactor.viewDidLoad()
	}
    
    @objc func didTapActionButton() {
        interactor.didTapActionButton()
    }
}

// MARK: - RulesViewControllerProtocol
extension RulesViewController: RulesViewControllerProtocol {

	func display(viewState: RulesViewState) {
        switch viewState {
        case .initial(let isTextRead):
            if !isTextRead {
                customView.actionButton.backgroundColor = .lightGray
                customView.actionButton.isEnabled = false
            } else {
                customView.actionButton.backgroundColor = Colors.violet
                customView.actionButton.isEnabled = true
            }
        }
	}
}

extension RulesViewController: UITextViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let bottomOffset = scrollView.contentOffset.y + scrollView.bounds.height
        let isAtBottom = bottomOffset >= scrollView.contentSize.height
        if isAtBottom {
            interactor.textViewScrollDidEndDragging()
        }
    }
}
