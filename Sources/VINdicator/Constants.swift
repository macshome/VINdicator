//
//  Constants.swift
//  
//
//  Created by Josh Wisenbaker on 9/13/22.
//

/// Table for the transliteration of VIN letters to numbers.
let transTable = ["A": "1",
                  "B": "2",
                  "C": "3",
                  "D": "4",
                  "E": "5",
                  "F": "6",
                  "G": "7",
                  "H": "8",
                  "J": "1",
                  "K": "2",
                  "L": "3",
                  "M": "4",
                  "N": "5",
                  "P": "7",
                  "R": "9",
                  "S": "2",
                  "T": "3",
                  "U": "4",
                  "V": "5",
                  "W": "6",
                  "X": "7",
                  "Y": "8",
                  "Z": "9"]

/// Weights to use for each place in a VIN code when calculating check digit.
let weights = [8, 7, 6, 5, 4, 3, 2, 10, 0, 9, 8, 7, 6, 5, 4, 3, 2]

/// US Government service to decode VIN data.
let nhtsaHost = "https://vpic.nhtsa.dot.gov/api/vehicles/DecodeVin/"
