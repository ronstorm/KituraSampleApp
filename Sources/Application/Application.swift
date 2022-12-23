//
// Created by Amit Sen on 23.12.22.
//

import Kitura
import LoggerAPI
import Dispatch

public class App {
    let router = Router()
    let workerQueue = DispatchQueue(label: "worker")

    public init() throws {
        Log.info("Kitura Sample App")
    }

    func postInit() throws {
        initializeCodableRoutes(for: self)
        initializeRawRoutes(app: self)
    }

    public func run() throws {
        try postInit()

        Kitura.addHTTPServer(onPort: 8080, with: router)
        Kitura.run()
    }

    // MARK: For thread-safety
    func execute(_ block: VoidBlock) {
        workerQueue.sync {
            block()
        }
    }
}