import Foundation

public final class Queue<T> {
    var front: Node<T>?
    var rear: Node<T>?

    public var count: Int

    public var isEmpty: Bool {
        return front == nil
    }

    public init() {
        count = 0
    }

    public func enqueue(_ value: T) {
        if isEmpty {
            front = Node(value: value)
            rear = front
        } else {
            rear?.next = Node(value: value)
            rear = rear?.next
        }

        count += 1
    }

    @discardableResult
    public func dequeue() -> T? {
        let currentNode = front
        front = front?.next

        if isEmpty {
            rear = nil
        }
        count -= 1

        return currentNode?.value
    }
}
