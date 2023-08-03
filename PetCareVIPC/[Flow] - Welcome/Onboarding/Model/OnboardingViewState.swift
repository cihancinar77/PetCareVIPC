//
//  OnboardingViewState.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 5.07.2023.
//

import UIKit

enum OnboardingViewState {
    case initial(type: OnboardingViewType, viewModel:OnboardingViewModel, isRulesCheckboxEnabled: Bool)
    case loading
    case success
    case error(alertViewModel: AlertViewModel)
}

enum OnboardingViewType {
    case register
    case signIn
}

struct OnboardingViewModel {
    let headlineText: String
    let actionButtonText: String
    let guiderLabelText: String
    let guiderButtonText: String
    var isRulesCheckboxEnabled: Bool?
    var isNewsletterCheckboxEnabled: Bool?
}

struct CheckBoxStatus {
    let isRulesCheckboxEnabled: Bool
    let isNewsletterCheckboxEnabled: Bool
}

struct OnboardingDataStore {
    var fullname: String?
    var email: String?
    var password: String?
    var isRulesCheckboxEnabled: Bool?
    var userDoesNotWantNewsletter: Bool?
}

struct AlertViewModel {
    let title: String
    let message: String
    let buttonTitle: String
}
