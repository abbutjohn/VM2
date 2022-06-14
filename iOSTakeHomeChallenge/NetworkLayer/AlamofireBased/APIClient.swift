//
//  Router.swift
//  iOSTakeHomeChallenge
//
//  Created by Abbut john on 14/06/2021.
//

import UIKit
import Alamofire

class APIClient {
    
    @discardableResult
    private static func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T, AFError>)->Void) -> DataRequest {
        
        return AF.request(route)
                        .responseDecodable (decoder: decoder){ (response: DataResponse<T, AFError>) in
                            completion(response.result)
        }
    }
    

    static func getBooks(completion:@escaping (Result<[Book], AFError>)->Void) {
        let jsonDecoder = JSONDecoder()
        performRequest(route: APIRouter.getBooks, decoder: jsonDecoder, completion: completion)
    }
    
    static func getHouses(completion:@escaping (Result<[House], AFError>)->Void) {
        let jsonDecoder = JSONDecoder()
        performRequest(route: APIRouter.getHouses, decoder: jsonDecoder, completion: completion)
    }
    
    static func getCharecters(completion:@escaping (Result<[Character], AFError>)->Void) {
        let jsonDecoder = JSONDecoder()
        performRequest(route: APIRouter.getCharecters, decoder: jsonDecoder, completion: completion)
    }
}

