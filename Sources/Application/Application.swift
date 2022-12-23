//
// Created by Amit Sen on 23.12.22.
//

import Kitura
import LoggerAPI

public class App {
    let router = Router()

    public init() throws {
        Log.info("Kitura Sample App")
    }

    func postInit() throws {
    }

    public func run() throws {
        try postInit()

        Kitura.addHTTPServer(onPort: 8080, with: router)
        Kitura.run()
    }
}