//
//  TreeStructure.swift
//  
//
//  Created by Mauricio Chirino on 17/2/23.
//

import Foundation

public protocol TreeStructure: DataStructurable {
    associatedtype T: Numeric

    /// Tree's root node
    var root: TreeNode<T>? { get }

    /// Prints the three representation in console, respecting its hierarchical distribution spanning from its root.
//    func graphicalRepresentation()
}

extension TreeStructure {
    public var isEmpty: Bool {
        root == nil
    }

    public func peek() -> T? {
        return root?.value
    }

    func graphicalRepresentation() {
        var maximumTabularSpace = treeHeight() - 1
        let queue = Queue<TreeNode<T>>()

        guard let root = root else {
            return
        }

        queue.enqueue(root)

        while maximumTabularSpace > 0 {
            while let currentLevel = queue.dequeue() {
                let spaces = String(repeating: "\t", count: maximumTabularSpace)
                print("\(spaces)\(currentLevel.value)")

                if let leftChild = currentLevel.left {
                    queue.enqueue(leftChild)
                }

                if let rightChild = currentLevel.right {
                    queue.enqueue(rightChild)
                }
            }
            maximumTabularSpace -= 1
        }
    }

    private func treeHeight() -> Int {
        return Int(log2(Double(count + 1))) - 1
    }
}
