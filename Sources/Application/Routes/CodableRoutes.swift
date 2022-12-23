//
// Created by Amit Sen on 23.12.22.
//

import Foundation

import KituraContracts

func initializeCodableRoutes(for app: App) {
    // Register routes here
    app.router.post("/codable", handler: app.postHandler)
    app.router.get("/codable", handler: app.getAllHandler)
    app.router.get("/codable", handler: app.getOneHandler)
}

extension App {
    static var codableStore = [Book]()

    // Write handlers here
    func postHandler(book: Book, completion: GetBook) {
        execute {
            App.codableStore.append(book)
        }
        completion(book, nil)
    }

    func getAllHandler(completion: GetBookList) {
        execute {
            completion(App.codableStore, nil)
        }
    }

    func getOneHandler(id: Int, completion: GetBook) {
        execute {
            guard let book = App.codableStore[optional: id] else {
                return completion(nil, .notFound)
            }
            completion(book, nil)
        }
    }
}