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

extension HeapNode: Equatable {
    static func == (lhs: HeapNode, rhs: HeapNode) -> Bool {
        return lhs.left == rhs.left &&
        lhs.right == rhs.right &&
        lhs.parent == rhs.parent
    }
}

final class MinHeap {
    var count: Int
    var root: HeapNode?
    var bottom: HeapNode?

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
            bottom = root
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
        bottom = node
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

    func peek() -> Int? {
        return root?.value
    }

    func extractMin() -> Int? {
        guard let currentMin = root?.value else {
            return nil
        }

        var pointer = root

        while pointer?.left != nil {
            pointer = pointer?.left
        }

        if let parent = pointer?.parent, let root = root {
            if let rightMostChild = parent.right {
                swap(&rightMostChild.value, &root.value)
                parent.right = nil
            } else if let leftMostChild = parent.left {
                swap(&leftMostChild.value, &root.value)
                parent.left = nil
            }
            siftDown(root)
        } else {
            root = nil
        }

        count -= 1

        print("+++++++")
        preOrderTraversal(node: root)
        print("+++++++")

        return currentMin
    }

    /// Restore Heap balance going up after last node insertion
    private func siftUp(_ node: HeapNode) {
        var current = node

        while let parent = current.parent, parent.value > current.value {
            swap(&parent.value, &current.value)
            current = parent
        }
    }

    /// Restore Heap balance after root node update
    private func siftDown(_ node: HeapNode) {
        if let rightChild = node.right, node.value > rightChild.value {
            swap(&rightChild.value, &node.value)
            siftDown(rightChild)
        } else if let leftChild = node.left, node.value > leftChild.value {
            swap(&leftChild.value, &node.value)
            siftDown(leftChild)
        }
    }
}
