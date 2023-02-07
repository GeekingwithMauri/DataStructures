//
//  TreePrintable.swift
//  
//
//  Created by Mauricio Chirino on 7/2/23.
//

import Foundation

public protocol TreePrintable {
    associatedtype T: Numeric

    /// Prints value in left-current-right order
    /// - Parameter node: starting point node
    func inOrderTraversal(node: TreeNode<T>?)

    /// Prints value in current-left-right order
    /// - Parameter node: starting point node
    func preOrderTraversal(node: TreeNode<T>?)

    /// Prints value in right-current-left order
    /// - Parameter node: starting point node
    func postOrderTraversal(node: TreeNode<T>?)
}

extension TreePrintable {
    public func inOrderTraversal(node: TreeNode<T>?) {
        if let currentNode = node {
            inOrderTraversal(node: currentNode.left)
            print(currentNode.value)
            inOrderTraversal(node: currentNode.right)
        }
    }

    public func preOrderTraversal(node: TreeNode<T>?) {
        if let currentNode = node {
            print(currentNode.value)
            preOrderTraversal(node: currentNode.left)
            preOrderTraversal(node: currentNode.right)
        }
    }
    
    public func postOrderTraversal(node: TreeNode<T>?) {
        if let currentNode = node {
            postOrderTraversal(node: currentNode.right)
            print(currentNode.value)
            postOrderTraversal(node: currentNode.left)
        }
    }
}
