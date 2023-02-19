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

        let queue: Queue<TreeNode<T>> = Queue<TreeNode<T>>()
        var maximumInitialPadding: Int = treeHeight()
        var treeLevel: Int = 0
        queue.enqueue(root)

        while maximumInitialPadding > 0 {
            let leafNumberInCurrentLevel: Int = Int(powf(2, Float(treeLevel)))
            let floorLevelPadding = Int(powf(2, Float(maximumInitialPadding - 1)))
            let centering: String = insertPadding(basedOn: treeLevel < treeHeight() - 1, amount: floorLevelPadding - 1)
            print(centering, terminator: "")

            (0..<leafNumberInCurrentLevel).forEach { _ in
                guard let currentLevel = queue.dequeue() else {
                    return
                }

                let childrenPadding: Int = Int(powf(2, Float(maximumInitialPadding)))
                let spaces: String = insertPadding(amount: childrenPadding)
                print("\(currentLevel.value)\(spaces)", terminator: "")

                if let leftChild = currentLevel.left {
                    queue.enqueue(leftChild)
                }

                if let rightChild = currentLevel.right {
                    queue.enqueue(rightChild)
                }
            }

            print()
            maximumInitialPadding -= 1
            treeLevel += 1
        }
    }

    private func insertPadding(basedOn condition: Bool = true, amount: Int) -> String {
        return condition ? String(repeating: "\t", count: amount) : ""
    }

    private func treeHeight() -> Int {
        return Int(round(log2(Double(count))))
    }
}
