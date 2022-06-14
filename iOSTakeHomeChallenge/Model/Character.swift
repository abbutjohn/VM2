//
//  Characters.swift
//  iOSTakeHomeChallenge
//
//  Created by Abbut john on 03/06/2021.
//

import Foundation

struct Character: Codable, Equatable {
    
    let url: String
    let name: String
    let gender: String
    let culture: String
    let born: String
    let died: String
    let aliases:  [String]
    let father: String
    let mother: String
    let spouse: String
    let allegiances: [String]
    let books: [String]
    let povBooks: [String]
    let tvSeries: [String]
    let playedBy: [String]

    static func ==(lhs: Character, rhs: Character) -> Bool {
        return lhs.name == rhs.name && lhs.culture == rhs.culture  && lhs.born == rhs.born && lhs.died == rhs.died && lhs.tvSeries == rhs.tvSeries
    }

}
