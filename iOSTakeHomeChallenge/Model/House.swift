//
//  House.swift
//  iOSTakeHomeChallenge
//
//  Created by Abbut john on 03/06/2021.
//

import Foundation

struct House: Codable, Equatable {
    
    let url: String
    let name: String
    let region: String
    let coatOfArms: String
    let words: String
    let titles: [String]
    let seats: [String]
    let currentLord: String
    let heir: String
    let overlord: String
    let founded: String
    let founder: String
    let diedOut: String
    let ancestralWeapons: [String]
    let cadetBranches: [String]
    let swornMembers: [String]

    static func ==(lhs: House, rhs: House) -> Bool {
        return lhs.name == rhs.name && lhs.region == rhs.region  && lhs.words == rhs.words
    }
}
