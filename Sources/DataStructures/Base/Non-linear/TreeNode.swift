//
//  TreeNode.swift
//  
//
//  Created by Mauricio Chirino on 20/1/23.
//

import Foundation

final class TreeNode<T: Numeric> {
    var value: T
    var left: TreeNode?
    var right: TreeNode?

    init(_ value: T) {
        self.value = value
    }
}
