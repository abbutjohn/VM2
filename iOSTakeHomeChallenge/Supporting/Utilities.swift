//
//  Utilities.swift
//  iOSTakeHomeChallenge
//
//  Created by Abbut john on 07/06/2021.
//

import Foundation


extension Date {
    
    func getFormattedDate(format: String) -> String {
        
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
