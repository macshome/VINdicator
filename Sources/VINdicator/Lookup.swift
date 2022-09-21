//
//  Lookup.swift
//  
//
//  Created by Josh Wisenbaker on 9/14/22.
//

import Foundation

struct Lookup {
    func lookupOnline(_ vin: String) async throws -> Vehicle {
        do {
            let jsonData = try await getData(vin)
            let vehicle = try decodeJSON(jsonData)
            return vehicle
        } catch {
            throw error
        }
    }

    func getData(_ vin: String) async throws -> Data {
        let query = URLQueryItem(name: "format", value: "json")
        guard var baseURL = URLComponents(string: nhtsaHost + vin) else {
            throw VindicatorError.onlineLookupFailed
        }
        baseURL.queryItems = [query]
        guard let queryURL = baseURL.url else {
            throw VindicatorError.onlineLookupFailed
        }
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: queryURL))
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
              throw VindicatorError.invalidServerResponse
            }
        return data
    }

    func decodeJSON(_ data: Data) throws -> Vehicle {

        do {
            let json = try JSONDecoder().decode(NHTSAResults.self, from: data)

            var make = ""
            var model = ""
            var year = ""
            var fuel = ""

            json.results.forEach { result in
                switch result.variableID {
                case 26:
                    make = result.value ?? "None"
                case 28:
                    model = result.value ?? "None"
                case 29:
                    year = result.value ?? "None"
                case 24:
                    fuel = result.value ?? "None"
                default:
                    return
                }
            }

            return Vehicle(make: make, model: model, year: year, fuel: fuel)
        } catch {
            throw error
        }
    }
}
