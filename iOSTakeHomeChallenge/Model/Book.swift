//
//  Book.swift
//  iOSTakeHomeChallenge
//
//  Created by Abbut john on 03/06/2021.
//

import Foundation

struct Book: Codable {
    
    let url: String
    let name: String
    let isbn: String
    let authors: [String]
    let numberOfPages: Int
    let publisher: String
    let country: String
    let mediaType: String
    let released: String
    let characters: [String]
}

