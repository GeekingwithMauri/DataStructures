//
//  MinHeap.swift
//  
//
//  Created by Mauricio Chirino on 21/1/23.
//

import Foundation

final class MinHeap<T: Numeric & Comparable> {
    var count: Int
    var root: TreeNode<T>?

    var isEmpty: Bool {
        root == nil
    }

    init() {
        count = 0
    }

    func insert(_ value: T, debugPrint: Bool = false) {
        if let root = root {
            insert(value, from: root)
        } else {
            root = TreeNode(value)
        }

        if debugPrint {
            print("=====")
            preOrderTraversal(node: root)
            print("=====")
        }

        count += 1
    }

    private func insert(_ value: T, from root: TreeNode<T>) {
        let queue = Queue<TreeNode<T>>()
        queue.enqueue(root)

        while !queue.isEmpty {
            guard let current = queue.dequeue() else {
                break
            }

            if current.left == nil {
                let newNode = TreeNode(value, parent: current)
                current.left = newNode
                siftUp(newNode)
                break
            } else {
                queue.enqueue(current.left!)
            }

            if current.right == nil {
                let newNode = TreeNode(value, parent: current)
                current.right = newNode
                siftUp(newNode)
                break
            } else {
                queue.enqueue(current.right!)
            }
        }
    }

    /// Restore Heap balance going up after last node insertion
    private func siftUp(_ node: TreeNode<T>) {
        var current = node

        while let parent = current.parent, parent.value > current.value {
            swap(&parent.value, &current.value)
            current = parent
        }
    }

    private func preOrderTraversal(node: TreeNode<T>?) {
        if let currentNode = node {
            print(currentNode.value)
            preOrderTraversal(node: currentNode.left)
            preOrderTraversal(node: currentNode.right)
        }
    }

    func peek() -> T? {
        return root?.value
    }

    func extractMin(debugPrint: Bool = false) -> T? {
        guard count > 1 else {
            let currentMin = root?.value
            root = nil
            count = 0

            return currentMin
        }

        guard let currentMin = root?.value, let root = root else {
            return nil
        }

        let queue = Queue<TreeNode<T>>()
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
    private func siftDown(_ node: TreeNode<T>) {
        var current = node

        while (current.left != nil || current.right != nil) {
            var smallest = current

            if (current.left != nil && current.left!.value < smallest.value) {
                smallest = current.left!
            }

            if (current.right != nil && current.right!.value < smallest.value) {
                smallest = current.right!
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
