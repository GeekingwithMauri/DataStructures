//
//  TreeNode.swift
//  
//
//  Created by Mauricio Chirino on 20/1/23.
//

import Foundation

public final class TreeNode<T: Numeric> {
    var value: T
    var parent: TreeNode?
    var left: TreeNode?
    var right: TreeNode?

    init(_ value: T, parent: TreeNode? = nil) {
        self.value = value
        self.parent = parent
    }
}
