//
//  ChallengeAPIEndpoints.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 22/11/20.
//

import Foundation

enum ChallengeAPIEndpoint: RequestEndpointProtocol {
    case favoriteStocksList
    case favoriteStockDetail(identifier: String)
    
    func path(urlBase: URL) -> URL {
        switch self {
        case .favoriteStocksList:
            return urlBase.appendingPathComponent("favorites")
        case .favoriteStockDetail(let identifier):
            return urlBase.appendingPathComponent("favorites/\(identifier)")
        }
    }
}
