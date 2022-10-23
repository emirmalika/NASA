//
//  NetworkService.swift
//  NasaApp
//
//  Created by Malik Em on 28.09.2022.
//

import Foundation

class NetworkService {
    func request(urlString: String, completion: @escaping (Result<DataResponse, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("Some error")
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                do {
                    let json = try JSONDecoder().decode(DataResponse.self, from: data)
                    completion(.success(json))
                } catch let jsonError {
                    print("Failde to decode JSON", jsonError)
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
}

