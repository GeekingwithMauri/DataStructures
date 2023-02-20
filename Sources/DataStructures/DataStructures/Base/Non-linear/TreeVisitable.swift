//
//  TreeVisitable.swift
//  
//
//  Created by Mauricio Chirino on 7/2/23.
//

import Foundation

/// Sets of possible visiting order for a tree
public protocol TreeVisitable {
    associatedtype T: Numeric

    /// Closure that handles every visited node in the tree printable methods.
    var visitedNode: (TreeNode<T>) -> Void { get set }

    /// Visit value in left-current-right order
    /// - Parameter node: starting point node
    func inOrderTraversal(node: TreeNode<T>?)

    /// Visit value in current-left-right order
    /// - Parameter node: starting point node
    func preOrderTraversal(node: TreeNode<T>?)

    /// Visit value in right-current-left order
    /// - Parameter node: starting point node
    func postOrderTraversal(node: TreeNode<T>?)
}

extension TreeVisitable {
    public func inOrderTraversal(node: TreeNode<T>?) {
        if let currentNode = node {
            inOrderTraversal(node: currentNode.left)
            visitedNode(currentNode)
            inOrderTraversal(node: currentNode.right)
        }
    }

    public func preOrderTraversal(node: TreeNode<T>?) {
        if let currentNode = node {
            visitedNode(currentNode)
            preOrderTraversal(node: currentNode.left)
            preOrderTraversal(node: currentNode.right)
        }
    }
    
    public func postOrderTraversal(node: TreeNode<T>?) {
        if let currentNode = node {
            postOrderTraversal(node: currentNode.right)
            visitedNode(currentNode)
            postOrderTraversal(node: currentNode.left)
        }
    }
}
