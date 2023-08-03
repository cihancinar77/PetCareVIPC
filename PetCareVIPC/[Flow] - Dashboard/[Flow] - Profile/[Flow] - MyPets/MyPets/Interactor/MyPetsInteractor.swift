//
//  MyPetsInteractor.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 14.07.2023.
//

import Foundation

protocol MyPetsInteractorProtocol: AnyObject {
	func viewDidLoad()
    func didTapAddButton()
}

protocol MyPetsInteractorCoordinatorDelegate: AnyObject {
    func addNewPet()
}

final class MyPetsInteractor {

    private var myPet: NewPetDataStore?
	weak var coordinator: MyPetsInteractorCoordinatorDelegate?
	private let presenter: MyPetsPresenterProtocol

	init(presenter: MyPetsPresenterProtocol) {
		self.presenter = presenter
	}
}

// MARK: - MyPetsInteractorProtocol
extension MyPetsInteractor: MyPetsInteractorProtocol {

	func viewDidLoad() {
        if let newPetDataStore = UserDefaults.standard.data(forKey: "newPetDataStore") {
            do {
                let decoder = JSONDecoder()
                let pet = try decoder.decode(NewPetDataStore.self, from: newPetDataStore)
                myPet = pet
                guard let myPet = myPet else { return }
                presenter.setupInitialState(myPet: myPet)
            } catch {
                print("Error decoding user data: \(error)")
            }
        }
	}
    
    func didTapAddButton() {
        coordinator?.addNewPet()
    }
}
