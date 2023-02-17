//
//  BinaryTree.swift
//  
//
//  Created by Mauricio Chirino on 20/1/23.
//

import Foundation

/// Binary tree implementation for any type of numeric value
public final class BinaryTree<T: Numeric & Comparable>: TreeVisitable {
    public var visitedNode: (TreeNode<T>) -> Void

    public var count: Int

    /// Tree's root node
    public var root: TreeNode<T>?

    /// Default initialization
    /// - Parameter visitNode: closure that handles every visited node in the tree visitable methods. Defaults to `print` the current node's value
    public init(visitNode: @escaping (TreeNode<T>) -> Void = { currentNode in
        print(currentNode.value)
    }) {
        count = 0
        self.visitedNode = visitNode
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

    /// Searches for a given value within the current tree
    /// - Parameter newValue: the desired value to look for
    /// - Returns: The tree height at which the desired key is located (starting from `0` as the _root_, `1` as the first children and so forth).
    /// It returns `-1` if the key isn't located in the tree
    public func search(_ keyValue: T) -> Int {
        guard !isEmpty else {
            return -1
        }

        var height = 0
        var currentNode = root

        while currentNode != nil {
            guard let currentValue = currentNode?.value else {
                break
            }

            if currentValue == keyValue {
                return height
            } else if keyValue < currentValue {
                currentNode = currentNode?.left
            } else {
                currentNode = currentNode?.right
            }

            height += 1
        }

        return -1
    }
}

extension BinaryTree: TreeStructure { }
