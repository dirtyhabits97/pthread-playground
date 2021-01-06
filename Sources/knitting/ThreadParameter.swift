// FILE: ThreadParameter.swift

import Foundation

class ThreadParameter {

        var id: ThreadIdentifier
        var server: Server

        init(id: ThreadIdentifier, server: Server) {
                self.id = id
                self.server = server
        }

}

struct ThreadIdentifier {

        var id: String

}
