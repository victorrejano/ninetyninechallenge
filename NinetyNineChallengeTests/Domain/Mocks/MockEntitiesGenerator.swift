//
//  MockEntitiesGenerator.swift
//  NinetyNineChallengeTests
//
//  Created by Victor Rejano on 22/11/20.
//

import Foundation
@testable import NinetyNineChallenge

enum MockEntitiesGenerator {
    static func createFavoriteStocksList(amount: Int = Int.random(in: 1...20)) -> FavoriteStocks {
        return amount < 1 ? [] :
            (1...amount).map { "\($0)" }
    }
    
    static func createStock() -> Stock {
        return Stock(name: "Stock name",
                     hot: 1,
                     reutersInstrumentCode: "RicCode",
                     category: "Category")
    }
}
