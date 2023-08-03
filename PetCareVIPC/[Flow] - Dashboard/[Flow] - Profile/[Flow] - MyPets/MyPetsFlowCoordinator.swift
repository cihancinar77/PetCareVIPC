//
//  MyPetsFlowCoordinator.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 14.07.2023.
//

import UIKit

final class MyPetsFlowCoordinator: FlowCoordination {
    
    private var rootViewController: UIViewController?
    private(set) var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let myPetsViewController = MyPetsViewController.build(coordinator: self)
        rootViewController = myPetsViewController
        navigationController.pushViewController(myPetsViewController, animated: true)
    }
}

extension MyPetsFlowCoordinator: MyPetsInteractorCoordinatorDelegate {
    func addNewPet() {
        let addNewPetViewController = AddNewPetViewController.build(coordinator: self)
        navigationController.pushViewController(addNewPetViewController, animated: true)
    }
}

extension MyPetsFlowCoordinator: AddNewPetInteractorCoordinatorDelegate {
    func didSaveFinish() {
        navigationController.popViewController(animated: true)
    }
    
    
}
