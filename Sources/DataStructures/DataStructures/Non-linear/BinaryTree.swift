//
//  BinaryTree.swift
//  
//
//  Created by Mauricio Chirino on 20/1/23.
//

import Foundation

/// Binary tree implementation for any type of numeric value
public final class BinaryTree<T: Numeric & Comparable> {
    /// Nodes count
    var count: Int

    /// Tree's root node
    var root: TreeNode<T>?

    /// Default initialization
    public init() {
        count = 0
    }

    /// Inserts values in a left-most orderly fashion
    /// - Parameter newValue: numeric value to be added
    public func insert(_ newValue: T) {
        let newNode = TreeNode(newValue)

        if root == nil {
            root = newNode
            count += 1

            return
        }

        var current = root

        while true {
            if newValue < current!.value {
                if current?.left == nil {
                    current?.left = newNode
                    count += 1

                    break
                } else {
                    current = current?.left
                }
            } else {
                if current?.right == nil {
                    current?.right = newNode
                    count += 1

                    break
                } else {
                    current = current?.right
                }
            }
        }
    }

    /// Prints value in left-current-right order
    /// - Parameter node: starting point node
    public func inOrderTraversal(node: TreeNode<T>?) {
        if let currentNode = node {
            inOrderTraversal(node: currentNode.left)
            print(currentNode.value)
            inOrderTraversal(node: currentNode.right)
        }
    }

    /// Prints value in current-left-right order
    /// - Parameter node: starting point node
    public func preOrderTraversal(node: TreeNode<T>?) {
        if let currentNode = node {
            print(currentNode.value)
            preOrderTraversal(node: currentNode.left)
            preOrderTraversal(node: currentNode.right)
        }
    }

    /// Prints value in right-current-left order
    /// - Parameter node: starting point node
    public func postOrderTraversal(node: TreeNode<T>?) {
        if let currentNode = node {
            postOrderTraversal(node: currentNode.right)
            print(currentNode.value)
            postOrderTraversal(node: currentNode.left)
        }
    }
}
