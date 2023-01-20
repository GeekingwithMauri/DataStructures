//
//  BinaryTree.swift
//  
//
//  Created by Mauricio Chirino on 20/1/23.
//

import Foundation

public final class BinaryTree<T: Numeric & Comparable> {
    var root: TreeNode<T>?

    public func insert(_ value: T) {
        let newNode = TreeNode(value)
        if root == nil {
            root = newNode
            return
        }

        var current = root

        while true {
            if value < current!.value {
                if current?.left == nil {
                    current?.left = newNode
                    break
                } else {
                    current = current?.left
                }
            } else {
                if current?.right == nil {
                    current?.right = newNode
                    break
                } else {
                    current = current?.right
                }
            }
        }
    }
}
