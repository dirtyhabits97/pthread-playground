// FILE: Queue.swift

import Foundation

struct Queue<T> {

        // MARK: - Properties

        var clients = [T]()

        var count: Int { clients.count }
        var isEmpty: Bool { clients.isEmpty }

        // MARK: - Methods

        mutating func enqueue(_ client: T) {
                clients.append(client)
        }

        mutating func dequeue() -> T? {
                if clients.isEmpty { return nil }
                return clients.removeFirst()
        }

        func peek() -> T? {
                clients.first
        }

}
