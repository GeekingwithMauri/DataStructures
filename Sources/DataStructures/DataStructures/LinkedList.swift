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

    private func node(at index: Int) -> Node<T>? {
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

        let pointer = node(at: index)
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

        return node(at: index)?.value
    }

    public func print() {
        var pointer = head

        while pointer != nil {
//            let previous = memoryAddress(for: pointer?.previous)
//            let next = memoryAddress(for: pointer?.next)
//            let current = memoryAddress(for: pointer)
//            Swift.print("P: \(previous) \t C: \(current) \t N: \(next))")
            if let value = pointer?.value {
                Swift.print("\(value)", terminator: "\t")
            }

            pointer = pointer?.next
        }

        Swift.print()
    }

    public func buildArray() -> [T] {
        guard !isEmpty, let initialValue = head?.value else {
            return []
        }

        var pointer = head
        var i = 0
        var elements: [T] = Array(repeating: initialValue, count: count)

        while pointer != nil {
            if let value = pointer?.value {
                elements[i] = value
            }

            pointer = pointer?.next
            i += 1
        }

        return elements
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
