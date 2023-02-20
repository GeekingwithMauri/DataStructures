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
    /// - Returns: the number of printed elements
    @discardableResult
    func graphicalRepresentation() -> Int
}

extension TreeStructure {
    public var isEmpty: Bool {
        root == nil
    }

    public func peek() -> T? {
        return root?.value
    }

    @discardableResult
    public func graphicalRepresentation() -> Int {
        guard let root = root else {
            return 0
        }

        let queue: Queue<TreeNode<T>> = Queue<TreeNode<T>>()
        var maximumInitialPadding: Int = treeHeight()
        var treeLevel: Int = 0
        var printedElements: Int = 0
        queue.enqueue(root)


        while maximumInitialPadding >= 0 {
            let leafNumberInCurrentLevel: Int = Int(powf(2, Float(treeLevel)))
            let floorLevelPadding = Int(powf(2, Float(maximumInitialPadding - 1)))
            let centering: String = insertPadding(basedOn: treeLevel < treeHeight(), amount: floorLevelPadding)
            print(centering, terminator: "")

            (0..<leafNumberInCurrentLevel).forEach { i in
                guard let currentLevel = queue.dequeue() else {
                    return
                }

                let childrenPadding: Int = Int(powf(2, Float(maximumInitialPadding)))
                let spaces: String = insertPadding(basedOn: i < leafNumberInCurrentLevel - 1,
                                                   amount: max(childrenPadding, 2))
                print("\(currentLevel.value)\(spaces)", terminator: "")
                printedElements += 1

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


        return printedElements
    }

    private func insertPadding(basedOn condition: Bool = true, amount: Int) -> String {
        return condition ? String(repeating: "\t", count: amount) : ""
    }

    private func treeHeight() -> Int {
        return Int(ceil(log2(Double(count))))
    }
}
