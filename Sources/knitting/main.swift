// FILE: main.swift
// source: https://rderik.com/blog/multithreading-with-pthreads-in-swift/

import Foundation

// The `phthread_create` method requires a global function
// that doesn't capture any context.
func threaddedFunction(pointer: UnsafeMutableRawPointer) -> UnsafeMutableRawPointer? {
        var param = pointer.load(as: ThreadParameter.self)
        var server = param.server
        var id = param.id

        while let client = server.clients.dequeue() {
                server.processClient(client, thread: id.id)
        }
        return nil
}

print("Welcome to the Server simulator")

let server = Server(numberOfClients: 10)
let startTime = CFAbsoluteTimeGetCurrent()
server.start()
let endTime = CFAbsoluteTimeGetCurrent()
print("Duration: \(endTime - startTime) seconds")
