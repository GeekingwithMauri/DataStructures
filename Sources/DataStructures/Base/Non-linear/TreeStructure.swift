//
//  TreeStructure.swift
//  
//
//  Created by Mauricio Chirino on 17/2/23.
//

import Foundation

public protocol TreeStructure: DataStructurable {
    associatedtype T: Numeric

    /// Tree's root node
    var root: TreeNode<T>? { get }

    /// Prints the three representation in console, respecting its distribution spanning from its root.
    func graphicalRepresentation()
}

extension TreeStructure {
    public var isEmpty: Bool {
        root == nil
    }

    public func peek() -> T? {
        return root?.value
    }

    public func graphicalRepresentation() { }
}
