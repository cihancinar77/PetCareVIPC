//
//  SearchListingInteractor.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 22.07.2023.
//

import Foundation

protocol SearchListingInteractorProtocol: AnyObject {
	func viewDidLoad()
    func didTapCloseButton()
    func didSelectSpeciality(selectedSpeciality: String, date: Date?)
}

protocol SearchListingInteractorCoordinatorDelegate: AnyObject {
    func didTapCloseButton()
    func didSelectSpeciality(selectedSpeciality: String, date: Date?)
}

final class SearchListingInteractor {
    
// MARK: - DataStore
    private var selectedSpeciality: String?
    private var selectedDate: Date?
    
// MARK: - Properties
    private var searchListingModel: SearchListingModel?
	weak var coordinator: SearchListingInteractorCoordinatorDelegate?
	private let presenter: SearchListingPresenterProtocol
    init(presenter: SearchListingPresenterProtocol) {
        self.presenter = presenter
    }
}

// MARK: - SearchListingInteractorProtocol
extension SearchListingInteractor: SearchListingInteractorProtocol {

	func viewDidLoad() {
        do {
            if let bundlePath = Bundle.main.path(forResource: "searchListing", ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8)
            {
                let result = try JSONDecoder().decode(SearchListingModel.self, from: jsonData)
                self.searchListingModel = result
                presenter.setupInitialState(searchListingModel: result)
            }
        } catch {
            print(error)
        }
	}
    
    func didTapCloseButton() {
        coordinator?.didTapCloseButton()
    }
    
    func didSelectSpeciality(selectedSpeciality: String, date: Date?) {
        self.selectedSpeciality = selectedSpeciality
        self.selectedDate = date
        coordinator?.didSelectSpeciality(selectedSpeciality: selectedSpeciality, date: selectedDate)
    }
}
