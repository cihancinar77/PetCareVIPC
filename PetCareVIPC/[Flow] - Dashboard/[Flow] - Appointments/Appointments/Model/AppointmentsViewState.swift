//
//  AppointmentsViewState.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 10.07.2023.
//

import UIKit

enum AppointmentsViewState {
    case initial(tableViewModel: [AppointmentsTableViewModel], selectedSegmentIndex: Int)
}

struct AppointmentModel: Decodable {
    let image: String?
    let name: String
    let title: String
    let rating: Double
    let numberOfReviews: Int
    let distance: Double
    let cost: Int
    let facilityName: String
    let adress: String
    let date: String
    let time: String
    let isEditable: Bool
    let isCancellationEnabled: Bool
}

struct AppointmentsTableViewModel {
    let image: String?
    let name: String
    let title: String
    let rating: Double
    let numberOfReviews: String
    let distance: String
    let cost: String
    let facilityName: String
    let adress: String
    let date: String
    let time: String
    let isEditable: Bool
    let isCancellationEnabled: Bool
}
