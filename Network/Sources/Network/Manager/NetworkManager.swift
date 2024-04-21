//
//  File.swift
//  
//
//  Created by Berke Parıldar on 21.04.2024.
//

import Foundation
import Moya



public protocol NetworkManagerProtocol {
    func fetchProducts(completion: @escaping (Result<[ProductAPI], Error>) -> Void)
    func fetchSuggestedProducts(completion: @escaping (Result<[ProductAPI], Error>) -> Void)
}

public class NetworkManager: NetworkManagerProtocol {
    
    public init() {}
    
    let provider = MoyaProvider<NetworkService>()

    public func fetchSuggestedProducts(completion: @escaping (Result<[ProductAPI], Error>) -> Void) {
        provider.request(.getSuggestedProducts) { result in
            switch result {
            case .success(let moyaResponse):
                do {
                    let decodedData = try JSONDecoder().decode([NetworkProductResponse].self, from: moyaResponse.data)
                    guard let products = decodedData.first?.results else { return }
                    completion(.success(products))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func fetchProducts(completion: @escaping (Result<[ProductAPI], Error>) -> Void) {
        provider.request(.getProducts) { result in
            switch result {
            case .success(let moyaResponse):
                do {
                    let decodedData = try JSONDecoder().decode([NetworkProductResponse].self, from: moyaResponse.data)
                    guard let products = decodedData.first?.results else { return }
                    completion(.success(products))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
