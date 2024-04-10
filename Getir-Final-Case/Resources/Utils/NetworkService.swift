//
//  NetworkService.swift
//  Getir-Final-Case
//
//  Created by Berke Parıldar on 9.04.2024.
//

import Foundation
import Moya
import RxSwift
import RxMoya



enum NetworkService {
    case getProducts
    case getSuggestedProducts
}

enum NetworkError: Error {
    case unknown
}

extension NetworkService: TargetType {
    var baseURL: URL {
        URL(string: "https://65c38b5339055e7482c12050.mockapi.io/api")!
    }
    
    var path: String {  
        switch self {
        case .getProducts:
            return "/products"
        case .getSuggestedProducts:
            return "/suggestedProducts"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getProducts, .getSuggestedProducts:
            return .get
        }
    }
    
    var task: Task {
        .requestPlain
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}

struct NetworkManager {
    static let shared = NetworkManager()
    let provider = MoyaProvider<NetworkService>()
}
