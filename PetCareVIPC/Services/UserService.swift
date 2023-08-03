//
//  UserService.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 6.07.2023.
//

import Foundation

struct ErrorViewModel {
    let title: String
    let message: String
}

enum LoginError: Error {
    
    case authFailed
    case wrongPassword
    case wrongEmail
    case weakPassword
    case emailAlreadyExists
    case notAgreedWithRules
	case missingFullName
    
    var errorViewModel: ErrorViewModel {
        switch self {
        case .authFailed:
            return .init(title: "Auth failed!", message: "Authentication Failed! Please try again later.")
        case .wrongPassword:
            return .init(title: "Auth failed!", message: "Password is wrong.")
        case .wrongEmail:
            return .init(title: "Auth failed!", message: "Email is invaid!")
        case .weakPassword:
            return .init(title: "Auth failed!", message: "Password must be longer than 8 characters")
        case .emailAlreadyExists:
            return .init(title: "Auth failed!", message: "email already exists")
        case .notAgreedWithRules:
            return .init(title: "Auth failed!", message: "User must read and agree with the rules.")
		case .missingFullName:
			return .init(title: "Auth failed!", message: "Full name should not be empty")
		}
    }
}

struct User: Codable {
    let fullname: String
    let email: String
    let token: String
}

enum AuthServiceRequests {
	struct Register {
		let fullname: String
		let email: String
		let password: String
		let newsletterEnabled: Bool
	}
	
	struct Login {
		let email: String
		let password: String
	}
}

final class AuthService {
    
	static func registerUser(request: AuthServiceRequests.Register, completion: @escaping ( Result<User, LoginError>) -> Void) {
        
		// Success
		DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
			let user = User(fullname: request.fullname, email: request.email, token: "token1234")
			completion(.success(user))
		}
        
        // Failure
//        completion(.failure(.emailAlreadyExists))
    }
    
    static func loginUser(request: AuthServiceRequests.Login, completion: @escaping (Result<User, LoginError>) -> Void) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            // Success
            let user = User(fullname: "Guest", email: request.email, token: "token1234")
            completion(.success(user))
            
            // Failure
            //completion(.failure(.wrongEmail))
        }
    }
}

