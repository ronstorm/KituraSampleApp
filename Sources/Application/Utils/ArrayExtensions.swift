//
// Created by Amit Sen on 23.12.22.
//

import Foundation

extension Array where Element: Equatable {
    subscript(optional index: Index) -> Iterator.Element? {
        self.indices.contains(index) ? self[index] : nil
    }
}