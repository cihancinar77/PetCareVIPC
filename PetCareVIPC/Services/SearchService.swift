//
//  SearchService.swift
//  PetCareVIPC
//
//  Created by Cihan Cinar on 28.07.2023.
//

import Foundation

protocol SearchServiceProtocol {
    func request<T: Codable>(url: URL?, expecting: T.Type, completion: @escaping(Result<T, Error>) -> Void)
}

class SearchService: SearchServiceProtocol {
	
	private let networkService: NetworkServiceProtocol
	
	init(networkService: NetworkServiceProtocol) {
		self.networkService = networkService
	}
	
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
