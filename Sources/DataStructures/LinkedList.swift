import Foundation

public final class LinkedList<T> {
    var head: Node<T>?
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
            head = Node(value: value)
            tail = head
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
        var pointer = head

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

        let pointer = pointer(at: index)
        let previousPointer = pointer?.previous
        let nextPointer = pointer?.next

        if let previous = previousPointer {
            previous.next = nextPointer
        } else {
            head = nextPointer
        }

//        if let next = nextPointer {
//            next.next
//        }

        pointer?.next = nil
        pointer?.previous = nil

        count -= 1
    }

    public func element(at index: Int) -> T? {
        guard shouldPerformSearch(for: index) else {
            return nil
        }

        return pointer(at: index)?.value
    }

    public func print() {
        var pointer = head

        while pointer != nil {
//            let previous = memoryAddress(for: pointer?.previous)
//            let next = memoryAddress(for: pointer?.next)
//            let current = memoryAddress(for: pointer)
//            Swift.print("P: \(previous) \t C: \(current) \t N: \(next))")
            if let value = pointer?.value {
                Swift.print("\(value)")
            }

            pointer = pointer?.next
        }
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
        return head == nil
    }

    public func peek() -> T? {
        return head?.value
    }
}
