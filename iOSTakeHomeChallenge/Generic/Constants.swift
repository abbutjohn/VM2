//
//  Constants.swift
//  iOSTakeHomeChallenge
//
//  Created by Abbut John on 12/07/2021.
//

import Foundation

struct K {
    struct productionServer {
        
        static let baseURL = "https://anapioficeandfire.com"

    }
    
    struct appConstants {
        static let pages = "pages"
        static let dateFormatFromServer = "yyyy-MM-dd'T'HH:mm:ss"
        static let dateFormatToShow = "MMM yyyy"
        static let nilString = ""
        static let spaceString = " "
        static let season1 = "Season 1"
        static let season2 = "Season 2"
        static let season3 = "Season 3"
        static let season4 = "Season 4"
        static let season5 = "Season 5"
        static let season6 = "Season 6"
        static let season7 = "Season 7"
        static let season8 = "Season 8"

    }
    
    struct cellConstants {
        static let booksTableViewCell = "BooksTableViewCell"
        static let HouseTableViewCell = "HouseTableViewCell"
        static let CharacterTableViewCell = "CharacterTableViewCell"
    }
    
    
}

enum hTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum contentType: String {
    case json = "application/json"
}
