//
//  SearchResultsPresenter.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 24.07.2023.
//

import UIKit

protocol SearchResultsPresenterProtocol: AnyObject {
    func setupInitialState(listingState: ListingState, tableViewData: [SearchResultsModel], selectedSpeciality: String, date: Date?)
    func presentFilteredListing(listingState: ListingState, tableViewData: [SearchResultsModel], selectedFilterIndex: Int, selectedSpeciality: String, date: Date?)
}

final class SearchResultsPresenter: SearchResultsPresenterProtocol {
    
    weak var viewController: SearchResultsViewControllerProtocol?
    
    func setupInitialState(listingState: ListingState, tableViewData: [SearchResultsModel], selectedSpeciality: String, date: Date?) {
        
        guard let date = date else { return }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM"
        let dateString = dateFormatter.string(from: date)
        let collectionViewModel: [String] = [dateString, selectedSpeciality]
        
        var tableViewModel: [SearchResultsTableViewModel] = []
        for item in tableViewData {
            print(selectedSpeciality)
            if item.title.contains(selectedSpeciality) {
                let model = SearchResultsTableViewModel(
                    image: item.image,
                    name: item.name,
                    title: item.title,
                    rating: item.rating,
                    numberOfReviews: "\(item.numberOfReviews) Reviews",
                    distance: "\(item.distance) km",
                    cost: "$\(item.cost)"
                )
                tableViewModel.append(model)
            }
        }
        viewController?.display(viewState: .initial(listingState: listingState, tableViewData: tableViewModel, collectionViewModel: collectionViewModel))
    }
    
    func presentFilteredListing(listingState: ListingState, tableViewData: [SearchResultsModel], selectedFilterIndex: Int, selectedSpeciality: String, date: Date?) {
        guard let date = date else { return }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM"
        let dateString = dateFormatter.string(from: date)
        
        var collectionViewModel: [String] = []
        var sortedTableViewModel: [SearchResultsModel] = []
        switch selectedFilterIndex {
        case 0:
            sortedTableViewModel = tableViewData.sorted { $0.name < $1.name }
            collectionViewModel = [dateString, selectedSpeciality, "A-Z"]
        case 1:
            sortedTableViewModel = tableViewData.sorted { $0.name > $1.name }
            collectionViewModel = [dateString, selectedSpeciality, "Z-A"]
        case 2:
            sortedTableViewModel = tableViewData.sorted { $0.distance < $1.distance }
            collectionViewModel = [dateString, selectedSpeciality, "Distance (low-high)"]
        case 3:
            sortedTableViewModel = tableViewData.sorted { $0.cost < $1.cost }
            collectionViewModel = [dateString, selectedSpeciality, "Price (low-high)"]
        default:
            break
        }
        
        var tableViewModel: [SearchResultsTableViewModel] = []
        for item in sortedTableViewModel {
            print(selectedSpeciality)
            if item.title.contains(selectedSpeciality) {
                let model = SearchResultsTableViewModel(
                    image: item.image,
                    name: item.name,
                    title: item.title,
                    rating: item.rating,
                    numberOfReviews: "\(item.numberOfReviews) Reviews",
                    distance: "\(item.distance) km",
                    cost: "$\(item.cost)"
                )
                tableViewModel.append(model)
            }
        }
        viewController?.display(viewState: .initial(listingState: listingState, tableViewData: tableViewModel, collectionViewModel: collectionViewModel))
    }
}
