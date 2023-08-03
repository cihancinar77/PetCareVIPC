//
//  MyPetsViewState.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 14.07.2023.
//

import UIKit

enum MyPetsViewState {
    case initial(myPet: MyPetsViewModel)
}


struct MyPetsViewModel {
    let image: UIImage
    let name: String
    let breed: String
}
