import Foundation

public final class Node<T> {
    public let value: T
    public var next: Node?
    public var previous: Node?

    public init(value: T) {
        self.value = value
    }
}
