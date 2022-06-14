//
//  Router.swift
//  iOSTakeHomeChallenge
//
//  Created by Abbut john on 03/06/2021.
//

import Foundation

enum Router {
    
    // 1.
    case getBooks
    case getHouses
    case getCharecters
    
    // 2.
    var scheme: String {
        switch self {
        case .getBooks, .getHouses, .getCharecters:
            return "https"
        }
    }
    
    // 3.
    var host: String {
        switch self {
        case .getBooks, .getHouses, .getCharecters:
            return "anapioficeandfire.com"
        }
    }
    
    // 4.
    var path: String {
        switch self {
        case .getBooks:
            return "/api/books"
        case .getHouses:
            return "/api/houses"
        case .getCharecters:
            return "/api/characters"
        }
    }
    // 5.
    var method: String {
        switch self {
        case .getBooks, .getHouses, .getCharecters:
            return "GET"
        }
    }
    
    // 6.
    var parameters: [URLQueryItem] {
        switch self {
        case .getBooks, .getHouses, .getCharecters:
            return []
    }
 }
}
