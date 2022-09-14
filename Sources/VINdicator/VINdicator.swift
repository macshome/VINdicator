public struct VINdicator {
    public init() {}

    public func validateVin(_ vin: String) -> Bool {
       return Validator().validate(vin)
    }
}
