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
                while let client = clients.dequeue() {
                        print("client to process: \(client)")
                        processClient(client, thread: "main")
                }
        }

        // MARK: - Methods

        func processClient(_ client: Client, thread: String) {
                print("Processing client: \(client) in Thread: \(thread)")
                sleep(1)
                print("Done processing client: \(client) in Thread: \(thread)")
        }

}
