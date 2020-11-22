//
//  StockDTO.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 22/11/20.
//

import Foundation

struct StockDTO {
    let name: String
    let hot: Int
    let ricCode: String
    let category: String
}

extension StockDTO: Decodable {}
