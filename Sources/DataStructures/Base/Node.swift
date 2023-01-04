import Foundation

final class Node<T> {
    let value: T
    var next: Node?
    var previous: Node?

    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}
