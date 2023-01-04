import Foundation

public final class Stack<T> {
    var top: Node<T>?

    public var count: Int

    public var isEmpty: Bool {
        return top == nil
    }

    public init() {
        count = 0
    }

    public func push(_ value: T) {
        let currentTop = top
        top = Node(value: value)
        top?.next = currentTop
        count += 1
    }

    @discardableResult
    public func pop() -> T? {
        let currentTop = top
        top = top?.next
        count -= 1

        return currentTop?.value
    }
}
