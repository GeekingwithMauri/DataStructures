//
//  DataStructurable.swift
//  
//
//  Created by Mauricio Chirino on 4/1/23.
//

import Foundation

/// Set of properties and methods all data structures should share
public protocol DataStructurable: AnyObject {
    associatedtype Element

    /// Number of elements within the data structure at all times
    var count: Int { get }

    /// Whether the data structure is empty (no elements)
    var isEmpty: Bool { get }

    /// The top most element for a given data structure.
    /// - Returns: the value of the `Element` type the data structure is holding
    func peek() -> Element?
}
