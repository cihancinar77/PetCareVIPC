//
//  SearchListingViewState.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 22.07.2023.
//

import UIKit

enum SearchListingViewState {
    case initial(tableViewData:[[String]])
}

struct SearchListingModel: Decodable {
    let popularSpecialities: [String]
    let allSpecialities: [String]
    let veterinaries: [SearchSpecialistModel]
    let babers: [SearchSpecialistModel]
}

struct SearchSpecialistModel: Decodable {
    let image: String?
    let name: String
    let title: String
    let rating: Double
    let numberOfReviews: Int
    let distance: Double
    let cost: Int
}
