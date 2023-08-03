//
//  OnboardingPresenter.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 5.07.2023.
//

import UIKit

protocol OnboardingPresenterProtocol: AnyObject {
    func setupInitialState(type: OnboardingViewType, checkBoxes: CheckBoxStatus)
    func presentRulesCheckBox(isRulesCheckboxEnabled: Bool)
    func presentRulesCheckBox(isNewsletterCheckboxEnabled: Bool)
    func presentLoadingStatus(isLoadingFinished: Bool)
    func presentAlert(error: LoginError)
    func presentRules()
}

final class OnboardingPresenter: OnboardingPresenterProtocol {
    
    weak var viewController: OnboardingViewControllerProtocol?
    
    func setupInitialState(type: OnboardingViewType, checkBoxes: CheckBoxStatus) {
        
        switch type {
        case .register:
            let viewModel = OnboardingViewModel(
                headlineText: "Registration",
                actionButtonText: "Sign Up",
                guiderLabelText: "Already have an account?",
                guiderButtonText: "Sign In",
                isRulesCheckboxEnabled: checkBoxes.isRulesCheckboxEnabled,
                isNewsletterCheckboxEnabled: checkBoxes.isNewsletterCheckboxEnabled
            )
            viewController?.display(viewState: .initial(type: type, viewModel: viewModel, isRulesCheckboxEnabled: checkBoxes.isRulesCheckboxEnabled))
        case .signIn:
            let viewModel = OnboardingViewModel(
                headlineText: "Sign In",
                actionButtonText: "Sign In",
                guiderLabelText: "Don't have account yet?",
                guiderButtonText: "Registration"
            )
            viewController?.display(viewState: .initial(type: type, viewModel: viewModel, isRulesCheckboxEnabled: checkBoxes.isRulesCheckboxEnabled))
        }
    }
    
    private func presentCheckBoxImage(isCheckboxEnabled: Bool) -> UIImage {
        if isCheckboxEnabled {
            let image = UIImage(named: "activated")!
            return image
        } else {
            let image = UIImage(named: "disabled")!
            return image
        }
    }
    
    func presentRulesCheckBox(isRulesCheckboxEnabled: Bool) {
        viewController?.displayRulesCheckBox(rulesCheckBoxImage: presentCheckBoxImage(isCheckboxEnabled: isRulesCheckboxEnabled))
    }
    
    func presentRulesCheckBox(isNewsletterCheckboxEnabled: Bool) {
        viewController?.displayRulesCheckBox(newsletterCheckBoxImage: presentCheckBoxImage(isCheckboxEnabled: isNewsletterCheckboxEnabled))
    }
    
    func presentLoadingStatus(isLoadingFinished: Bool) {
        if isLoadingFinished {
            viewController?.display(viewState: .success)
        } else {
            viewController?.display(viewState: .loading)
        }
    }
    
    func presentAlert(error: LoginError) {
        let errorTitle = error.errorViewModel.title
        let errorMessage = error.errorViewModel.message
        let alertModel = AlertViewModel(
            title: errorTitle,
            message: errorMessage,
            buttonTitle: "Done"
        )
        viewController?.display(viewState: .error(alertViewModel: alertModel))
    }
    
    func presentRules() {
        viewController?.displayRulesView()
    }
}

