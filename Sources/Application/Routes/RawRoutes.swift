//
// Created by Amit Sen on 23.12.22.
//

import Foundation

func initializeRawRoutes(app: App) {
    // Register routes with handlers here
    app.router.post("/raw") { request, response, next in
        do {
            let book = try request.read(as: Book.self)
            app.execute {
                App.bookStore.append(book)
            }
            response.send(book)
        } catch {
            let _ = response.send(status: .badRequest)
        }
        next()
    }

    app.router.get("/raw") { request, response, next in
        app.execute {
            response.send(App.bookStore)
        }
        next()
    }

    app.router.get("/raw/:id") { request, response, next in
        app.execute {
            guard let idString = request.parameters["id"],
                  let id = Int(idString),
                  let book = App.bookStore[optional: id] else {
                let _ = response.send(status: .badRequest)
                return next()
            }
            response.send(book)
        }
        next()
    }
}

extension App {
    static var bookStore = [Book]()
}