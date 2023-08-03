//
//  NetworkService.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 27.07.2023.
//

import Foundation

enum APIError: Error {
    case invalidUrl
    case invalidData
}

protocol NetworkServiceProtocol {
    func request<T: Codable>(url: URL?, expecting: T.Type, completion: @escaping(Result<T, Error>) -> Void)
}

final class NetworkService: NetworkServiceProtocol {

    func request<T: Codable>(url: URL?, expecting: T.Type, completion: @escaping(Result<T, Error>) -> Void) {
        guard let url = url else {
            completion(.failure(APIError.invalidUrl))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                if error != nil {
                    completion(.failure(APIError.invalidData))
                }
                return
            }

            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}


