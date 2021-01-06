// FILE: main.swift
// source: https://rderik.com/blog/multithreading-with-pthreads-in-swift/

import Foundation

print("Welcome to the Server simulator")

let server = Server(numberOfClients: 10)
let startTime = CFAbsoluteTimeGetCurrent()
server.start()
let endTime = CFAbsoluteTimeGetCurrent()
print("Duration: \(endTime - startTime) seconds")
