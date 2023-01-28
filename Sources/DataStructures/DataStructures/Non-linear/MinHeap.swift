//
//  MinHeap.swift
//  
//
//  Created by Mauricio Chirino on 21/1/23.
//

import Foundation

final class HeapNode {
    var value: Int
    var parent: HeapNode?
    var left: HeapNode?
    var right: HeapNode?

    init(_ value: Int) {
        self.value = value
    }
}

final class MinHeap {
    var count: Int
    var root: HeapNode?

    var isEmpty: Bool {
        root == nil
    }

    init() {
        count = 0
    }

    func insert(_ value: Int) {
        let newNode = HeapNode(value)

        if isEmpty {
            root = newNode
        } else {
            insert(node: newNode)
        }

        preOrderTraversal(node: root)
        print("=====")

        count += 1
    }

    private func insert(node: HeapNode) {
        var pointer = root

        while pointer?.left != nil {
            pointer = pointer?.left
        }

        if let parent = pointer?.parent {
            if parent.left == nil {
                 parent.left = node
                node.parent = parent
            } else if parent.right == nil {
                parent.right = node
                node.parent = parent
            } else {
                insert(node, at: pointer)
            }

        } else {
            insert(node, at: pointer)
        }

        siftUp(node)
    }

    private func insert(_ node: HeapNode, at pointer: HeapNode?) {
        pointer?.left = node
        node.parent = pointer
    }

    private func preOrderTraversal(node: HeapNode?) {
        if let currentNode = node {
            print(currentNode.value)
            preOrderTraversal(node: currentNode.left)
            preOrderTraversal(node: currentNode.right)
        }
    }

    func extractMin() -> Int? {
        nil
    }

    private func siftUp(_ node: HeapNode) {
        var current = node

        while let parent = current.parent, parent.value > current.value {
            swap(&parent.value, &current.value)
            current = parent
        }
    }

    private func siftDown(_ node: HeapNode) {
        var current = node

        while let left = current.left {
            var smallest = current
            if left.value < smallest.value {
                smallest = left
            }
            if let right = current.right, right.value < smallest.value {
                smallest = right
            }
            if smallest !== current {
                swap(&smallest.value, &current.value)
                current = smallest
            } else {
                break
            }
        }
    }
}
