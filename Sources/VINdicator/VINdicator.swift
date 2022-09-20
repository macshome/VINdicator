public struct VINdicator {
    public init() {}

    @discardableResult public func validateVin(_ vin: String) throws -> Bool {
        do {
            try Validator().validate(vin)
        } catch {
            throw error
        }
        return true
    }

    @discardableResult public func lookupVin(_ vin: String) async throws -> Vehicle {
        do {
            let client = Lookup()
            try validateVin(vin)
            let vehicle = try await client.lookupOnline(vin)
            return vehicle
        } catch {
            throw error
        }
    }
}
