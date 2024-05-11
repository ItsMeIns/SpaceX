//
//  NetworkManager.swift
//  SpaceX
//
//  Created by Yevhenii Parfonov on 22.04.2024.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private func fetchData(from url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let data = data {
                completion(.success(data))
            }
        }.resume()
    }
    
    func getRocketInfo(completion: @escaping (Result<[RocketInfo], Error>) -> Void) {
        let apiURL = "https://api.spacexdata.com/v4/rockets"
        
        guard let url = URL(string: apiURL) else {
            print("Invalid rocket url...")
            return
        }
        
        fetchData(from: url) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let info = try decoder.decode([RocketInfo].self, from: data)
                    completion(.success(info))
                } catch {
                    completion(.failure(error))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getLaunch(completion: @escaping (Result <[Launch], Error>) -> Void) {
        let apiURL = "https://api.spacexdata.com/v4/launches"
        
        guard let url = URL(string: apiURL) else {
            print("Invalid launch url...")
            return
        }
        
        fetchData(from: url) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let info = try decoder.decode([Launch].self, from: data)
                    completion(.success(info))
                } catch {
                    completion(.failure(error))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
 }
