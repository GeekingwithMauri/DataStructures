//
//  MinHeap.swift
//  
//
//  Created by Mauricio Chirino on 21/1/23.
//

import Foundation

final class MinHeapNode {
    let value: Int
    var parent: MinHeapNode?
    var left: MinHeapNode?
    var right: MinHeapNode?

    init(_ value: Int) {
        self.value = value
    }
}

final class MinHeap {
    var root: MinHeapNode?
    var count: Int

    var isEmpty: Bool {
        root == nil
    }

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
        if node.value < parent.value {
            if let left = parent.left {
                insert(node: node, at: left)
            } else {
                parent.left = node
                node.parent = parent
            }
        } else {
            if let right = parent.right {
                insert(node: node, at: right)
            } else {
                parent.right = node
                node.parent = parent
            }
        }
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
}
