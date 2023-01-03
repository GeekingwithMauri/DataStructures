import Foundation

public final class Node<T> {
    public let value: T
    public var next: Node?

    public init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}
