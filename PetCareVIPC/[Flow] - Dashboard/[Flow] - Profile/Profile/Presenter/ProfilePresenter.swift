//
//  ProfilePresenter.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 10.07.2023.
//

import UIKit

protocol ProfilePresenterProtocol: AnyObject {
    func setupInitialState(profileTableViewModel: [ProfileTableViewModel], userData: UserDataModel)
}

final class ProfilePresenter: ProfilePresenterProtocol {

	weak var viewController: ProfileViewControllerProtocol?

	func setupInitialState(profileTableViewModel: [ProfileTableViewModel], userData: UserDataModel) {
        viewController?.display(viewState: .initial(profileTableViewModel: profileTableViewModel, userData: userData))
	}
}
