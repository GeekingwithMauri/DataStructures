//
//  MinHeap.swift
//  
//
//  Created by Mauricio Chirino on 21/1/23.
//

import Foundation

class MinHeapNode {
    var value: Int
    var parent: MinHeapNode?
    var left: MinHeapNode?
    var right: MinHeapNode?

    init(_ value: Int) {
        self.value = value
    }
}

class MinHeap {
    var root: MinHeapNode?

    var isEmpty: Bool {
        root == nil
    }

    var count: Int

    init() {
        count = 0
    }

    func insert(_ value: Int) {
        let newNode = MinHeapNode(value)

        if let root = root {
            insert(node: newNode, at: root)
        } else {
            root = newNode
        }

        count += 1
    }

    private func insert(node: MinHeapNode, at parent: MinHeapNode) {

    }

    func extractMin() -> Int? {
        guard let root = root else {
            return nil
        }
        let minNode = findMinNode(root)
        if minNode.parent == nil {
            // minNode is root
            self.root = nil
        } else {
            if minNode.parent?.left === minNode {
                minNode.parent?.left = nil
            } else {
                minNode.parent?.right = nil
            }
        }
        if let left = minNode.left, let right = minNode.right {
            self.root = left
            left.parent = nil
            insert(node: right, at: root)
        } else if let left = minNode.left {
            self.root = left
            left.parent = nil
        } else if let right = minNode.right {
            self.root = right
            right.parent = nil
        }
        siftDown(root)
        count -= 1

        return minNode.value
    }

    private func findMinNode(_ node: MinHeapNode) -> MinHeapNode {
        if let left = node.left {
            return findMinNode(left)
        } else {
            return node
        }
    }

    private func siftUp(_ node: MinHeapNode) {
        var current = node

        while var parent = current.parent, parent.value > current.value {
            swap(&parent.value, &current.value)
            current = parent
        }
    }

    private func siftDown(_ node: MinHeapNode) {
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
