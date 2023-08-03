//
//  AddNewPetPresenter.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 15.07.2023.
//

import UIKit

protocol AddNewPetPresenterProtocol: AnyObject {
	func setupInitialState()
    func presentPickedImage(pickedImage: UIImage)
    func presentSpecies(species: String)
    func presentBreed(breed: String)
    func presentSize(size: String)
    func presentDob(dob: String)
    func presentAlert()
    func presentSelectSpeciesAlert()
    func presentPickerSelection(type: PickerViewType)
}

final class AddNewPetPresenter: AddNewPetPresenterProtocol {

	weak var viewController: AddNewPetViewControllerProtocol?

	func setupInitialState() {
		viewController?.display(viewState: .initial)
	}
    
    func presentPickedImage(pickedImage: UIImage) {
        viewController?.displayPickedImage(pickedImage: pickedImage)
    }
    
    func presentPickerSelection(type: PickerViewType) {
        var title = ""
        switch type {
        case .species:
            title = "Select Species"
        case .breed:
            title = "Select Breed"
        case .size:
            title = "Select Size"
        }
        viewController?.displayPickerView(type: type, title: title)
    }
    
    func presentSpecies(species: String) {
        viewController?.displaySpecies(species: species)
    }
    
    func presentBreed(breed: String) {
        viewController?.displayBreed(breed: breed)
    }
    
    func presentSize(size: String) {
        viewController?.displaySize(size: size)
    }
    
    func presentDob(dob: String) {
        viewController?.displayDob(dob: dob)
    }
    
    func presentAlert() {
        let viewModel = AlertViewModel(title: "Failed to save!", message: "Please fill each section carefully.", buttonTitle: "Done")
        viewController?.display(viewState: .error(alertViewModel: viewModel))
    }
    
    func presentSelectSpeciesAlert() {
        let viewModel = AlertViewModel(title: "Alert", message: "Please select species first.", buttonTitle: "Close")
        viewController?.display(viewState: .error(alertViewModel: viewModel))
    }
}
