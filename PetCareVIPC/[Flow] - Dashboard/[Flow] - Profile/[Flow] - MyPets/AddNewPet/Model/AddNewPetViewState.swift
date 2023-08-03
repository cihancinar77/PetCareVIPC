//
//  AddNewPetViewState.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 15.07.2023.
//

import UIKit

enum AddNewPetViewState {
	case initial
    case error(alertViewModel: AlertViewModel)
}

enum AddPetSwitchType: Int {
    case neutered = 0
    case vaccinated = 1
    case microchipped = 2
}

enum PickerViewType: Int {
    case species = 0
    case breed = 1
    case size = 2
}

struct NewPetDataStore: Codable {
    var petImage: Data?
    var petName: String?
    var species: String?
    var breed: String?
    var size: String?
    var gender: String?
    var dateOfBirth: String?
    var neutered: Bool
    var vaccinated: Bool
    var microchipped: Bool
}

enum ActionSheetModel {
    case species
    case breed(AnimalSpecies)
    case size
    case dateOfBirth
    
    var actionSheetModel: [String] {
        switch self {
        case .species:
            return [
                AnimalSpecies.dog.rawValue,
                AnimalSpecies.cat.rawValue,
                AnimalSpecies.bird.rawValue
            ]
        case .breed(let animalSpecies):
            return animalSpecies.animalSpecies
        case .size:
            return ["Small", "Medium", "Large"]
        case .dateOfBirth:
            return []
        }
    }
}

enum AnimalSpecies: String {
    case dog = "Dog"
    case cat = "Cat"
    case bird = "Bird"

    var animalSpecies: [String] {
        switch self {
        case .dog:
            return ["Golden Retriever", "Labrador Retriever", "Poodle", "Boxer"]
        case .cat:
            return ["Persian", "Siamese", "Maine Coon"]
        case .bird:
            return ["African Bird", "Asian Bird"]
        }
    }
}

enum PetSize {
    case small
    case medium
    case large
    case extraLarge
}

enum CellType {
    case addEvent
    case reminder(icon: UIImage, title: String, date: String)
}
