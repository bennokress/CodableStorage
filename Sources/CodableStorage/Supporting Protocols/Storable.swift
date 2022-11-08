//
// 📄 Storable.swift
// 👨🏼‍💻 Author: Benno Kress
//

import Foundation

public protocol Storable {

    var key: String { get }
    var destination: StorageDestination { get }
    var description: String { get }
    var authentticationPrompt: String { get }

}

// MARK: Convenience Methods

extension Storable {

    func save(_ encodedValue: Data) throws {
        try destination.save(encodedValue, for: key)
    }

    func hasStoredValue() throws -> Bool {
        try destination.containsEncodedValue(for: key)
    }

    func getStoredValue() throws -> Data {
        try destination.getEncodedValue(for: key, authenticationPromptIfNeeded: authentticationPrompt)
    }

    func deleteStoredValue() throws {
        try destination.deleteEncodedValue(for: key)
    }

}
