//
// Created by Amit Sen on 23.12.22.
//

import Foundation
import KituraContracts

typealias VoidBlock = () -> Void
typealias GetBook = (Book?, RequestError?) -> Void
typealias GetBookList = ([Book]?, RequestError?) -> Void