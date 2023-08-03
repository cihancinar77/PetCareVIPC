//
//  ProfileViewState.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 10.07.2023.
//

import UIKit

enum ProfileViewState {
	case initial(profileTableViewModel: [ProfileTableViewModel], userData: UserDataModel)
}

struct ProfileTableViewModel: Decodable {
   let id: String
   let image: String
   let title: String
}

struct UserDataModel: Decodable {
   let fullname: String
}
