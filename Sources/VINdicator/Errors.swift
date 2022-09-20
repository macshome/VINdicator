//
//  Errors.swift
//  
//
//  Created by Josh Wisenbaker on 9/20/22.
//

import Foundation

public enum VindicatorError: LocalizedError {
    case vinTooShort
    case vinTooLong
    case invalidVin
    case onlineLookupFailed
    case invalidServerResponse
}
