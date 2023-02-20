//
//  MinHeap.swift
//  
//
//  Created by Mauricio Chirino on 21/1/23.
//

import Foundation

/// `Min heap` data structure
public final class MinHeap<T: Numeric & Comparable>: TreeVisitable {
    public var root: TreeNode<T>?
    public var count: Int
    public var visitedNode: (TreeNode<T>) -> Void

    /// Initializes the `Min heap` data structure
    /// - Parameter initialValues: optionally, passes a generic array to base the initialization of data from
    /// - Parameter visitNode: closure that handles every visited node in the tree visitable methods. Defaults to `print` the current node's value
    public init(
        _ initialValues: [T] = [],
        visitNode: @escaping (TreeNode<T>) -> Void = { currentNode in
            print(currentNode.value)
        }
    ) {
        count = 0
        self.visitedNode = visitNode
        initialValues.forEach {
            insert($0)
        }
    }

    /// Inserts any given value.
    /// - Parameters:
    ///   - value: any valid numeric value to be inserted into the heap
    ///   - debugPrint: optionally, activate this flag if you want to look the state of the heap after the insertion.
    ///   The chosen print algorithm is pre order traversal. Defaults to `false`
    ///
    /// While this method guarantees O(1) access to the lowest value at all times, the nature to of the algorithm's internal working to do so is in a O(log n) fashion due to nodes' tree balancing after each operation (at worst case scenario)
    public func insert(_ value: T, debugPrint: Bool = false) {
        if let root = root {
            insert(value, from: root)
        } else {
            root = TreeNode(value)
        }

        count += 1

        if debugPrint {
            graphicalRepresentation()
            print("\n=====")
        }
    }

    /// Removes the lowest value from the heap
    /// - Parameters:
    ///   - debugPrint: optionally, activate this flag if you want to look the state of the heap after the insertion.
    ///   The chosen print algorithm is pre order traversal. Defaults to `false`
    ///
    /// While this method guarantees O(1) access to the lowest value at all times, the nature to of the algorithm's internal working to do so is in a O(log n) fashion due to nodes' tree balancing after each operation (at worst case scenario)
    public func extractMin(debugPrint: Bool = false) -> T? {
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
            graphicalRepresentation()
            print("\n+++++++")
        }

        return currentMin
    }
}

extension MinHeap: TreeStructure {}

private extension MinHeap {
    /// Guarantees balanced insertion
    /// - Parameters:
    ///   - value: new value entering the heap
    ///   - root: heap's root
    func insert(_ value: T, from root: TreeNode<T>) {
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

    /// Restores Heap balance going up after last node insertion
    func siftUp(_ node: TreeNode<T>) {
        var current = node

        while let parent = current.parent, parent.value > current.value {
            swap(&parent.value, &current.value)
            current = parent
        }
    }

    /// Restores Heap balance after root node update
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
