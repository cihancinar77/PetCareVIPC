//
//  SearchListingPresenter.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 22.07.2023.
//

import UIKit

protocol SearchListingPresenterProtocol: AnyObject {
	func setupInitialState(searchListingModel: SearchListingModel)
}

final class SearchListingPresenter: SearchListingPresenterProtocol {

	weak var viewController: SearchListingViewControllerProtocol?

	func setupInitialState(searchListingModel: SearchListingModel) {
        var tableViewData: [[String]] = []
        tableViewData.append(searchListingModel.popularSpecialities)
        tableViewData.append(searchListingModel.allSpecialities)
        
		viewController?.display(viewState: .initial(tableViewData: tableViewData))
	}
}
