//
//  Router.swift
//  iOSTakeHomeChallenge
//
//  Created by Abbut john on 14/06/2021.
//

import Foundation
import Alamofire

enum APIRouter :URLRequestConvertible{
    
    case getBooks
    case getHouses
    case getCharecters
    
    
    private var path: String {
        switch self {
        case .getBooks:
            return "/api/books"
        case .getHouses:
            return "/api/houses"
        case .getCharecters:
            return "/api/characters"
        }
    }
    
    private var method: HTTPMethod {
        switch self {
        case .getBooks, .getHouses, .getCharecters:
            return .get
        }
    }
    
    private var parameters: Parameters? {
        switch self {
        case .getBooks, .getHouses, .getCharecters:
            return nil
        }
    }
    
    
    
    // MARK: - URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
        
        
        let url = try K.productionServer.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue(contentType.json.rawValue, forHTTPHeaderField: hTTPHeaderField.acceptType.rawValue)
        
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}

