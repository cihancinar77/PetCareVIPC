//
//  MyPetsPresenter.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 14.07.2023.
//

import UIKit

protocol MyPetsPresenterProtocol: AnyObject {
    func setupInitialState(myPet: NewPetDataStore)
}

final class MyPetsPresenter: MyPetsPresenterProtocol {

	weak var viewController: MyPetsViewControllerProtocol?

    func setupInitialState(myPet: NewPetDataStore) {
        guard let myPetImage = myPet.petImage,
        let myPetName = myPet.petName,
        let myPetBreed = myPet.breed else {
            return
        }
        let myPet = MyPetsViewModel(
            image: UIImage(data: myPetImage) ?? UIImage(named: "noImage")!,
            name: myPetName,
            breed: myPetBreed
        )
        viewController?.display(viewState: .initial(myPet: myPet))
	}
}
