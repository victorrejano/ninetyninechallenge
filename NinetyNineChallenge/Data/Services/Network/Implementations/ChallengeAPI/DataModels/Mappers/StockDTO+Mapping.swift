//
//  StockDTO+Mapping.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 22/11/20.
//

import Foundation

extension StockDTO {
    func toDomain() -> Stock {
        return Stock(name: name,
                     hot: hot,
                     reutersInstrumentCode: ricCode,
                     category: category)
    }
}
