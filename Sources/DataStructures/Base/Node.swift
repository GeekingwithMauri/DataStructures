import Foundation

final class Node<T> {
    let value: T
    var next: Node?
    var previous: Node?

    init(value: T) {
        self.value = value
    }
}
