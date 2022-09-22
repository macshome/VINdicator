public struct VINdicator {
    public init() {}

    /// Validates a VIN passed in as a `String`. This validation is performed on-device and does not require a network connection.
    /// - Parameter vin: A  17 character`String` representing a standard VIN code.
    /// - Returns: `true` if the VIN is in a valid format.
    /// - Throws: A `VindicatorError` if there is a problem with the VIN format.
    @discardableResult public func validateVin(_ vin: String) throws -> Bool {
        do {
            try Validator().validate(vin)
        } catch {
            throw error
        }
        return true
    }

    /// Validates a VIN and then performs a lookup against the NHTSA online database of VIN codes.
    /// - Parameter vin: A  17 character`String` representing a standard VIN code.
    /// - Returns: A `Vehicle` is returned after a sucessful validation and lookup.
    /// - Throws: A `VindicatorError` if there is a problem with the VIN format or the online lookup.
    public func lookupVin(_ vin: String) async throws -> Vehicle {
        do {
            try validateVin(vin)
            let client = Lookup()
            let vehicle = try await client.lookupOnline(vin)
            return vehicle
        } catch {
            throw error
        }
    }
}
