//
// 📄 CodableStorageService.swift
// 👨🏼‍💻 Author: Benno Kress
//

import Foundation

public protocol CodableStorageService {
    
    associatedtype Item: Storable

    /// Encodes the given value and saves it according to the storable rules.
    /// - Parameters:
    ///   - value: The value to be saved
    ///   - storable: The storable that the value represents
    func save(_ value: any Codable, as storable: Item) throws

    /// Checks if a value for the given storable exists.
    /// - Parameter storable: The storable to look for
    /// - Returns: Returns `true`, if  a value is found for the given storable
    func containsValue(for storable: Item) throws -> Bool

    /// Retrieves the value of the given storable, if found and convertable to the given type.
    /// - Parameter storable: The storable to look for
    /// - Parameter type: The type the value should be returned in
    /// - Returns: The desired value, if found and in the correct format or `nil` otherwise.
    func get<T: Codable>(_ storable: Item, as type: T.Type) throws -> T?

    /// Deletes the value for the given storable from Storage.
    /// - Parameter storable: The storable to delete
    func delete(_ storable: Item) throws

}

// MARK: Default Implementation

public extension CodableStorageService {

    func save(_ value: Codable, as storable: Item) throws {
        let encodedValue = try JSONEncoder().encode(value)
        try storable.save(encodedValue)
    }

    func containsValue(for storable: Item) throws -> Bool {
        try storable.hasStoredValue()
    }

    func get<T: Codable>(_ storable: Item, as type: T.Type) throws -> T? {
        let data = try storable.getStoredValue()
        let decoder = JSONDecoder()
        return try decoder.decode(type, from: data)
    }

    func delete(_ storable: Item) throws {
        try storable.deleteStoredValue()
    }

}
