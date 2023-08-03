//
//  ProfileInteractor.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 10.07.2023.
//

import Foundation

protocol ProfileInteractorProtocol: AnyObject {
	func viewDidLoad()
    func didSelectCell(index: Int)
}

protocol ProfileInteractorCoordinatorDelegate: AnyObject {
    func didProfileMenuSelectionFinish(index: Int)
}

final class ProfileInteractor {

    private var userData: UserDataModel?
    private var profileTableViewModel: [ProfileTableViewModel] = []
	weak var coordinator: ProfileInteractorCoordinatorDelegate?
	private let presenter: ProfilePresenterProtocol

	init(presenter: ProfilePresenterProtocol) {
		self.presenter = presenter
	}
	
    private func fetchViewModel(completion: @escaping ([ProfileTableViewModel]) -> Void) {
        do {
            if let bundlePath = Bundle.main.path(forResource: "profile", ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8)
            {
                let result = try JSONDecoder().decode([ProfileTableViewModel].self, from: jsonData)
                completion(result)
            }
        } catch {
            print(error)
        }
    }
}

// MARK: - ProfileInteractorProtocol
extension ProfileInteractor: ProfileInteractorProtocol {

	func viewDidLoad() {
        if let user = UserDefaults.standard.data(forKey: "loggedInUser") {
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(UserDataModel.self, from: user)
                userData = user
                guard let userData = userData else { return }
                fetchViewModel { profileTableViewModel in
                    self.profileTableViewModel = profileTableViewModel
                }
                presenter.setupInitialState(profileTableViewModel: profileTableViewModel, userData: userData)
            } catch {
                print("Error decoding user data: \(error)")
            }
        }
	}
    
    func didSelectCell(index: Int) {
        coordinator?.didProfileMenuSelectionFinish(index: index)
    }
}
