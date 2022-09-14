//
//  Validator.swift
//  
//
//  Created by Josh Wisenbaker on 9/13/22.
//

struct Validator {

    func validate(_ vin: String) -> Bool {
        if vin.count != 17 {
            return false
        }
        let checkDigit = calculateCheckDigit(vin)
        let sourceDigit = String(vin[vin.index(vin.startIndex, offsetBy: 8)])
        return checkDigit == sourceDigit
    }

    func transliterate(_ vin: String) -> [Int] {
        var result = [Int]()
        vin.forEach {
            if let transed = transTable[String($0)]  {
                result.append(Int(transed)!)
            } else {
                result.append(Int(String($0))!)
            }
        }
        return result
        }

    func calculateCheckDigit(_ vin: String) -> String {
        var sum = 0
        let trans = transliterate(vin)
        for (idx, val) in trans.enumerated() {
            sum += val * weights[idx]
            print(idx, val)
        }

        if sum % 11 == 10 {
            return "X"
        }
        
        let result = String(sum % 11)
        return result
    }
}
