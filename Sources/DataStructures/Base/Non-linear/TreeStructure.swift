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
    func graphicalRepresentation()
}

extension TreeStructure {
    public var isEmpty: Bool {
        root == nil
    }

    public func peek() -> T? {
        return root?.value
    }

    public func graphicalRepresentation() {
        guard let root = root else {
            return
        }

        let queue = Queue<TreeNode<T>>()
        var maximumTabularSpace = treeHeight()
        var treeLevel: Float = 0
        queue.enqueue(root)

        while maximumTabularSpace >= 0 {
            let leafNumberInCurrentLevel = Int(powf(2, treeLevel))
            let centering = String(repeating: "\t", count: maximumTabularSpace + 1)
            print(centering, terminator: "")

            (0..<leafNumberInCurrentLevel).forEach { _ in
                guard let currentLevel = queue.dequeue() else {
                    return
                }

                let spaces = String(repeating: "\t", count: Int(treeLevel))
                print("\(currentLevel.value)\(spaces)", terminator: "")

                if let leftChild = currentLevel.left {
                    queue.enqueue(leftChild)
                }

                if let rightChild = currentLevel.right {
                    queue.enqueue(rightChild)
                }
            }

            print()
            maximumTabularSpace -= 1
            treeLevel += 1
        }
    }

    private func treeHeight() -> Int {
        return Int(round(log2(Double(count))))
    }
}
