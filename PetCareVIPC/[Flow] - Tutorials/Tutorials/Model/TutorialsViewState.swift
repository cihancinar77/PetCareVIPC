//
//  TutorialsViewState.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 4.07.2023.
//

import UIKit

enum TutorialsViewState {
    case initial(data: [TutorialsViewModel])
}

struct TutorialsViewModel: Decodable {
    let image: String
    let headline: String
    let body: String
}
