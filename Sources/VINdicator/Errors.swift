//
//  Errors.swift
//  
//
//  Created by Josh Wisenbaker on 9/20/22.
//

import Foundation

public enum VindicatorError: LocalizedError {
   public case vinTooShort
   public case vinTooLong
   public case invalidVin
   public case onlineLookupFailed
   public case invalidServerResponse
}
