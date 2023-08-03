//
//  SearchPresenter.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 10.07.2023.
//

import UIKit

protocol SearchPresenterProtocol: AnyObject {
    func setupInitialState(userData: User, collectionData: [SearchCollectionViewModel])
}

final class SearchPresenter: SearchPresenterProtocol {

	weak var viewController: SearchViewControllerProtocol?
    
    private func presentHeadline(fullname: String) -> NSMutableAttributedString {
        let userName = fullname.components(separatedBy: " ").first ?? ""
        print(userName)
        let attributedHeadlineString = NSMutableAttributedString(string: "What are you looking for, \(userName)?")
        attributedHeadlineString.addAttributes([
            .foregroundColor: Colors.black!,
            .font: UIFont(name: Fonts.EncodeSans.bold, size: FontSize.h1Headline)!
        ], range: (attributedHeadlineString.string as NSString).range(of: "What are you looking for,"))
        attributedHeadlineString.addAttributes([
            .foregroundColor: Colors.yellow!,
            .font: UIFont(name: Fonts.EncodeSans.bold, size: FontSize.h1Headline)!
        ], range: (attributedHeadlineString.string as NSString).range(of: "\(userName)?"))
        return attributedHeadlineString
    }

	func setupInitialState(userData: User, collectionData: [SearchCollectionViewModel]) {
        let attributedTextForHeadline = presentHeadline(fullname: userData.fullname)
        let collectionViewModel = collectionData
        viewController?.display(viewState: .initial(attributedHeadlineString: attributedTextForHeadline, viewModel: collectionViewModel))
	}
}
