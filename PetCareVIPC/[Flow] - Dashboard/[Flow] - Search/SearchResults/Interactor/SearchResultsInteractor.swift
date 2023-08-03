//
//  SearchResultsInteractor.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 24.07.2023.
//

import Foundation

protocol SearchResultsInteractorProtocol: AnyObject {
    func viewDidLoad()
    func didSegmentValueChanged(value: Int)
    func didSelectFilter(selectedFilterIndex: Int)
}

protocol SearchResultsInteractorCoordinatorDelegate: AnyObject {
    
}

final class SearchResultsInteractor {
    
    private var searchService: SearchServiceProtocol
    private var searchData: [SearchResultsModel] = []
    private var selectedSpeciality: String
    private var date: Date?
    private var listingState = ListingState.specialist
    weak var coordinator: SearchResultsInteractorCoordinatorDelegate?
    private let presenter: SearchResultsPresenterProtocol
    init(searchService: SearchServiceProtocol, selectedSpeciality: String, date: Date? = nil, presenter: SearchResultsPresenterProtocol) {
        self.searchService = searchService
        self.selectedSpeciality = selectedSpeciality
        self.date = date
        self.presenter = presenter
    }
    
    private func fetchData(completion: @escaping ([SearchResultsModel]) -> Void ) {

        searchService.request(url: APIUrls.searchResultUrl, expecting: [SearchResultsModel].self) { [weak self] result in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self?.searchData = success
                    completion(success)
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
}

// MARK: - SearchResultsInteractorProtocol
extension SearchResultsInteractor: SearchResultsInteractorProtocol {
    
    func didSegmentValueChanged(value: Int) {
        if value == 0 {
            self.listingState = .specialist
        } else if value == 1 {
            self.listingState = .clinics
        }
        viewDidLoad()
    }
    
    func viewDidLoad() {
        fetchData { [self] searchData in
            presenter.setupInitialState(
                listingState: listingState,
                tableViewData: searchData,
                selectedSpeciality: selectedSpeciality,
                date: date
            )
        }
    }
    
    func didSelectFilter(selectedFilterIndex: Int) {
        presenter.presentFilteredListing(listingState: listingState, tableViewData: searchData, selectedFilterIndex: selectedFilterIndex, selectedSpeciality: selectedSpeciality, date: date)
    }
}
