//
//  AddNewPetInteractor.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 15.07.2023.
//

import UIKit

protocol AddNewPetInteractorProtocol: AnyObject {
    func viewDidLoad()
    func didPickImage(pickedImage: UIImage)
    func didNamingFinish(name: String)
    func didTapSpeciesSelect(selectedRow: Int)
    func didTapBreedSelect(selectedRow: Int)
    func didTapSizeSelect(selectedRow: Int)
    func didTapGenderSelect(selectedGender: Int)
    func didTapDobSelect(selectedDate: String)
    func didToggleSwitch(switchType: AddPetSwitchType)
    func didTapSaveButton()
    func didTapPickerSelection(type: PickerViewType)
}

protocol AddNewPetInteractorCoordinatorDelegate: AnyObject {
    func didSaveFinish()
}

final class AddNewPetInteractor {
    
    // MARK: - DataStore
    private var petImage: UIImage?
    private var petName: String?
    private var species: String?
    private var breed: String?
    private var size: String?
    private var gender: String?
    private var dateOfBirth: String?
    private var neutered = false
    private var vaccinated = false
    private var microchipped = false
    
    weak var coordinator: AddNewPetInteractorCoordinatorDelegate?
    private let presenter: AddNewPetPresenterProtocol
    
    init(presenter: AddNewPetPresenterProtocol) {
        self.presenter = presenter
    }
    
    private func convertImageToData(_ image: UIImage) -> Data? {
        return image.pngData()
        //return image.jpegData(compressionQuality: 0.8)
    }
}

// MARK: - AddNewPetInteractorProtocol
extension AddNewPetInteractor: AddNewPetInteractorProtocol {
    
    func viewDidLoad() {
        presenter.setupInitialState()
    }
    
    func didPickImage(pickedImage: UIImage) {
        self.petImage = pickedImage
        presenter.presentPickedImage(pickedImage: pickedImage)
    }
    
    func didNamingFinish(name: String) {
        print(name)
        self.petName = name
    }
    
    func didTapPickerSelection(type: PickerViewType) {
        switch type {
        case .species:
            presenter.presentPickerSelection(type: .species)
        case .breed:
            guard self.species != nil else {
                presenter.presentSelectSpeciesAlert()
                return
            }
            presenter.presentPickerSelection(type: .breed)
        case .size:
            presenter.presentPickerSelection(type: .size)
        }
    }
    
    func didTapSpeciesSelect(selectedRow: Int) {
        self.species = ActionSheetModel.species.actionSheetModel[selectedRow]
        self.breed = ""
        guard let species = self.species else { return }
        presenter.presentSpecies(species: species)
    }
    
    func didTapBreedSelect(selectedRow: Int) {
        guard let species = self.species else { return }
        if let selected = AnimalSpecies(rawValue: species) {
           let breedArray = selected.animalSpecies
            self.breed = breedArray[selectedRow]
            presenter.presentBreed(breed: breedArray[selectedRow])
        }
    }
    
    func didTapSizeSelect(selectedRow: Int) {
        let selectedSize = ActionSheetModel.size.actionSheetModel[selectedRow]
        self.size = selectedSize
        presenter.presentSize(size: selectedSize)
    }
    
    func didTapGenderSelect(selectedGender: Int) {
        if selectedGender == 0 {
            self.gender = "Male"
        } else if selectedGender == 1 {
            self.gender = "Female"
        }
    }
    
    func didTapDobSelect(selectedDate: String) {
        self.dateOfBirth = selectedDate
        presenter.presentDob(dob: selectedDate)
    }
    
    func didToggleSwitch(switchType: AddPetSwitchType) {
        switch switchType {
        case .neutered:
            self.neutered.toggle()
        case .vaccinated:
            self.vaccinated.toggle()
        case .microchipped:
            self.microchipped.toggle()
        }
    }
    
    func didTapSaveButton() {
        
        if  self.petImage == nil {
            petImage = UIImage(named: "noImage")
        }
        
        guard let petName, petName.count > 3 else {
            presenter.presentAlert()
            return
        }
        
        guard let species, species != nil else {
            presenter.presentAlert()
            return
        }
        
        guard let image = self.petImage else { return }
        if let imageData = convertImageToData(image) {
            let newPetDataStore = NewPetDataStore(
                petImage: imageData,
                petName: self.petName,
                species: self.species,
                breed: self.breed,
                size: self.size,
                gender: self.gender,
                dateOfBirth: self.dateOfBirth,
                neutered: self.neutered,
                vaccinated: self.vaccinated,
                microchipped: self.microchipped)
            
            do {
                let encoder = JSONEncoder()
                let newPetDataStore = try encoder.encode(newPetDataStore)
                
                // Save the Data to UserDefaults
                UserDefaults.standard.set(newPetDataStore, forKey: "newPetDataStore")
                self.coordinator?.didSaveFinish()
            } catch {
                print("Error encoding user data: \(error)")
            }
        }
    }
    
}
