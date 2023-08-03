//
//  OnboardingInteractor.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 5.07.2023.
//

import Foundation

protocol OnboardingInteractorProtocol: AnyObject {
	func viewDidLoad()
    func didTapActionButton(
		fullname: String?,
		email: String?,
		password: String?
	)
    func didTapGuiderButton()
    func didTapRulesCheckboxButton()
    func didTapNewsLetterCheckboxButton()
    func didTapRulesButton()
    func didTapForgetPasswordButton()
}

protocol OnboardingInteractorCoordinatorDelegate: AnyObject {
    func didLoginFinish()
    func userRegisteredSuccessfully()
    func showRegistration()
    func showSignIn()
    func showForgetPasswordViewController()
}

final class OnboardingInteractor {
    
    private var isRulesCheckboxEnabled = false
    private var isNewsletterCheckboxEnabled = false
	weak var coordinator: OnboardingInteractorCoordinatorDelegate?
	private let presenter: OnboardingPresenterProtocol
    private let onboardingViewType: OnboardingViewType
	
	private let dataStore: OnboardingDataStore = OnboardingDataStore()
	
    init(presenter: OnboardingPresenterProtocol, onboardingViewType: OnboardingViewType) {
        self.presenter = presenter
        self.onboardingViewType = onboardingViewType
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    private func saveUserDefaults(user: User) {
		do {
			let encoder = JSONEncoder()
			let data = try encoder.encode(user)
			UserDefaults.standard.set(data, forKey: "loggedInUser")
		} catch {}
    }
}

// MARK: - OnboardingInteractorProtocol
extension OnboardingInteractor: OnboardingInteractorProtocol {

	func viewDidLoad() {
        print(isRulesCheckboxEnabled)
        let checkBoxes = CheckBoxStatus(isRulesCheckboxEnabled: isRulesCheckboxEnabled, isNewsletterCheckboxEnabled: isNewsletterCheckboxEnabled)
        presenter.setupInitialState(type: onboardingViewType, checkBoxes: checkBoxes)
	}
	
	func didTapActionButton(
		fullname: String?,
		email: String?,
		password: String?
	) {
		
		switch onboardingViewType {
		case .register:
			
			guard let fullname, fullname.count > 1 else {
				presenter.presentAlert(error: .missingFullName)
				return
			}
			
			guard let email, !email.isEmpty, isValidEmail(email) else {
				presenter.presentAlert(error: .wrongEmail)
				return
			}
			
			guard let password, password.count > 8 else {
				presenter.presentAlert(error: .weakPassword)
				return
			}
			
			guard isRulesCheckboxEnabled else {
				presenter.presentAlert(error: .notAgreedWithRules)
				return
			}
			
			let request = AuthServiceRequests.Register(
				fullname: fullname,
				email: email,
				password: password,
				newsletterEnabled: isNewsletterCheckboxEnabled
			)
			
			presenter.presentLoadingStatus(isLoadingFinished: false)
			
			AuthService.registerUser(request: request) { result in
				
				self.presenter.presentLoadingStatus(isLoadingFinished: true)
				
				switch result {
				case .success(let user):
					self.saveUserDefaults(user: user)
                    print("BURRDAAA")
                    self.coordinator?.userRegisteredSuccessfully()
				case .failure(let error):
					self.presenter.presentAlert(error: error)
					self.presenter.presentLoadingStatus(isLoadingFinished: true)
				}
			}
			
		case .signIn:
			
			guard let email, !email.isEmpty, isValidEmail(email) else {
				presenter.presentAlert(error: .wrongEmail)
				return
			}
			
			guard let password, password.count > 8 else {
				presenter.presentAlert(error: .weakPassword)
				return
			}
			
			
			let request = AuthServiceRequests.Login(
				email: email,
				password: password
			)
			
			presenter.presentLoadingStatus(isLoadingFinished: false)
			
			AuthService.loginUser(request: request) { result in
				self.presenter.presentLoadingStatus(isLoadingFinished: true)
				
				switch result {
				case .success(let user):
					self.saveUserDefaults(user: user)
                    self.coordinator?.didLoginFinish()
				case .failure(let error):
					self.presenter.presentAlert(error: error)
					self.presenter.presentLoadingStatus(isLoadingFinished: true)
				}
			}
		}
	}
    
    func didTapRulesButton() {
        presenter.presentRules()
        //coordinator?.showRulesViewController()
    }
    
    func didTapGuiderButton() {
        switch onboardingViewType {
        case .register:
            coordinator?.showSignIn()
        case .signIn:
            coordinator?.showRegistration()
        }
    }
    
    func didTapRulesCheckboxButton() {
        isRulesCheckboxEnabled.toggle()
        presenter.presentRulesCheckBox(isRulesCheckboxEnabled: isRulesCheckboxEnabled)
    }
    
    func didTapNewsLetterCheckboxButton() {
        isNewsletterCheckboxEnabled.toggle()
        presenter.presentRulesCheckBox(isNewsletterCheckboxEnabled: isNewsletterCheckboxEnabled)
    }
    
    func didTapForgetPasswordButton() {
        coordinator?.showForgetPasswordViewController()
    }
}
