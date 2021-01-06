// FILE: Server.swift

import Foundation

class Server {

        // MARK: - Properties

        var clients: Queue<Client>

        // MARK: - Lifecycle

        init(numberOfClients: Int) {
                clients = Queue<Client>()

                for clientId in 1...numberOfClients {
                        clients.enqueue(Client(id: clientId))
                }
        }

        func start() {
                createThread()
        }

        // MARK: - Methods

        func processClient(_ client: Client, thread: String) {
                print("Processing client: \(client) in Thread: \(thread)")
                sleep(1)
                print("Done processing client: \(client) in Thread: \(thread)")
        }

        private func createThread() {
                var myThread: pthread_t? = nil

                var threadParam = ThreadParameter(
                        id: ThreadIdentifier(id: "myThread"),
                        server: self
                )
                var pThreadParam = UnsafeMutablePointer<ThreadParameter>.allocate(capacity: 1)
                pThreadParam.pointee = threadParam

                let result = pthread_create(
                        &myThread,
                        nil,
                        threaddedFunction, // invoke global function from main.swift
                        pThreadParam
                )

                guard result == 0 else {
                        print("Error creating thread--")
                        exit(EXIT_FAILURE)
                }

                // we need to join the main thread with myThread
                // otherwise, the main thread will finish and the execution will stop
                pthread_join(myThread!, nil)
        }
                
}
