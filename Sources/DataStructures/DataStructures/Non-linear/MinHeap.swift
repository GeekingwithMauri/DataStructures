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

    init(_ value: Int, parent: HeapNode? = nil) {
        self.value = value
        self.parent = parent
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

    func insert(_ value: Int, debugPrint: Bool = false) {
        if let root = root {
            insert(value, from: root)
        } else {
            root = HeapNode(value)
        }

        if debugPrint {
            print("=====")
            preOrderTraversal(node: root)
            print("=====")
        }

        count += 1
    }

    private func insert(_ value: Int, from root: HeapNode) {
        let queue = Queue<HeapNode>()
        queue.enqueue(root)

        while !queue.isEmpty {
            guard let current = queue.dequeue() else {
                break
            }

            if current.left == nil {
                let newNode = HeapNode(value, parent: current)
                current.left = newNode
                siftUp(newNode)
                break
            } else {
                queue.enqueue(current.left!)
            }

            if current.right == nil {
                let newNode = HeapNode(value, parent: current)
                current.right = newNode
                siftUp(newNode)
                break
            } else {
                queue.enqueue(current.right!)
            }
        }
    }

    /// Restore Heap balance going up after last node insertion
    private func siftUp(_ node: HeapNode) {
        var current = node

        while let parent = current.parent, parent.value > current.value {
            swap(&parent.value, &current.value)
            current = parent
        }
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

    func extractMin(debugPrint: Bool = false) -> Int? {
        guard count > 1 else {
            let currentMin = root?.value
            root = nil

            return currentMin
        }
        
        guard let currentMin = root?.value, let root = root else {
            return nil
        }

        let queue = Queue<HeapNode>()
        queue.enqueue(root)

        while !queue.isEmpty {
            guard let current = queue.dequeue() else {
                break
            }

            if let leftMostChild = current.left {
                queue.enqueue(leftMostChild)
            } else if let lastNode = queue.rear?.value {
                swap(&lastNode.value, &root.value)
                lastNode.parent?.right = nil
                break
            }

            if let rightMostChild = current.right {
                queue.enqueue(rightMostChild)
            } else if let lastNode = queue.rear?.value {
                swap(&lastNode.value, &root.value)
                lastNode.parent?.left = nil
                break
            }
        }

        siftDown(root)

        count -= 1

        if debugPrint {
            print("+++++++")
            preOrderTraversal(node: root)
            print("+++++++")
        }

        return currentMin
    }

    /// Restore Heap balance after root node update
    private func siftDown(_ node: HeapNode) {
        if let leftChild = node.left, node.value > leftChild.value {
            swap(&leftChild.value, &node.value)
            siftDown(leftChild)
        } else if let rightChild = node.right, node.value > rightChild.value {
            swap(&rightChild.value, &node.value)
            siftDown(rightChild)
        }
    }
}
