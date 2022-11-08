//
// 📄 StorageDestination.swift
// 👨🏼‍💻 Author: Benno Kress
//

import Foundation

/// A destination that can save and retrieve encoded values for a specified key. Popular examples are a local Cache, UserDefaults, Keychain, …
public protocol StorageDestination {

    func save(_ encodedValue: Data, for key: String) throws
    func containsEncodedValue(for key: String) throws -> Bool
    func getEncodedValue(for key: String, authenticationPromptIfNeeded authenticationPrompt: String) throws -> Data
    func deleteEncodedValue(for key: String) throws

}
