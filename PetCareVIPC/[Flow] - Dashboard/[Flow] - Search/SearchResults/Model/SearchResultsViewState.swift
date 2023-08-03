//
//  SearchResultsViewState.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 24.07.2023.
//

import UIKit

enum SearchResultsViewState {
    case initial(listingState: ListingState, tableViewData: [SearchResultsTableViewModel], collectionViewModel: [String])
}

struct SearchResultsModel: Codable {
    let image: String?
    let name: String
    let title: String
    let rating: Double
    let numberOfReviews: Int
    let distance: Double
    let cost: Int
}

struct SearchResultsTableViewModel: Codable {
    let image: String?
    let name: String
    let title: String
    let rating: Double
    let numberOfReviews: String
    let distance: String
    let cost: String
}

enum ListingState {
    case specialist
    case clinics
}

