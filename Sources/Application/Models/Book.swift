//
// Created by Amit Sen on 23.12.22.
//

import Foundation

struct Book: Codable, Equatable {
    let id: Int
    let title: String
    let price: Double
    let genre: String

    init(id: Int, title: String, price: Double, genre: String) {
        self.id = id
        self.title = title
        self.price = price
        self.genre = genre
    }

    static func ==(lhs: Book, rhs: Book) -> Bool {
        lhs.id == rhs.id
    }
}
