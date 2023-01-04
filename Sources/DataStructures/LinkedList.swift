import Foundation

public final class LinkedList<T> {
    var front: Node<T>?
    var tail: Node<T>?

    public var count: Int
    public typealias Element = T

    public init(initialElements: [T] = []) {
        count = 0

        initialElements.forEach {
            append($0)
        }
    }

    private func shouldPerformSearch(for index: Int) -> Bool {
        return index >= 0 && index < count && !isEmpty
    }

    public func append(_ value: T) {
        if isEmpty {
            front = Node(value: value)
            tail = front
        } else {
            let previousNode = tail
            tail?.next = Node(value: value)
            tail = tail?.next
            tail?.previous = previousNode
        }

        count += 1
    }

    private func pointer(at index: Int) -> Node<T>? {
        var i = 0
        var pointer = front

        while pointer != nil && i != index {
            pointer = pointer?.next
            i += 1
        }

        return pointer
    }

    public func remove(at index: Int) {
        guard shouldPerformSearch(for: index) else {
            return
        }

        var pointer = pointer(at: index)

        let previous = memoryAddress(for: pointer?.previous)
        let next = memoryAddress(for: pointer?.next)
        let current = memoryAddress(for: pointer)

//        Swift.print("Before deleting")
//        Swift.print("P: \(previous) \t C: \(current) \t N: \(next))")

        let previousPointer = pointer?.previous
        pointer = pointer?.next
        pointer?.previous = previousPointer

//        Swift.print("After deleting")
//        Swift.print("P: \(previous) \t C: \(current) \t N: \(next))")

        count -= 1
    }

    public func element(at index: Int) -> T? {
        guard shouldPerformSearch(for: index) else {
            return nil
        }

        return pointer(at: index)?.value
    }

    public func print() {
        var pointer = front
        Swift.print()

        while pointer != nil {
            let previous = memoryAddress(for: pointer?.previous)
            let next = memoryAddress(for: pointer?.next)
            let current = memoryAddress(for: pointer)

            Swift.print("P: \(previous) \t C: \(current) \t N: \(next))")

            pointer = pointer?.next
        }
        Swift.print()
    }

    private func memoryAddress(for node: Node<T>?) -> String {
        if let node = node {
            return "\(Unmanaged.passUnretained(node).toOpaque())"
        } else {
            return "nil"
        }
    }
}

extension LinkedList: DataStructurable {
    public var isEmpty: Bool {
        return front == nil
    }

    public func peek() -> T? {
        return front?.value
    }
}
