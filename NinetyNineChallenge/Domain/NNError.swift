//
//  NNError.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 22/11/20.
//

import Foundation

enum NNError: Error {
    var description: String {
        switch self {
        case .data(let type):
            return type == Data.unableToObtain ?
                "Couldn't retrieve data. Try it again later" : "Data hasn't a valid format" 
        case .network(let error): return error.localizedDescription
        case .custom(let description): return description
        case .unknown(_): return "Unknown error. Try it again later"
        }
    }
    
    case data(Data)
    case network(Error)
    case custom(String)
    case unknown(Error)
    
    enum Data {
        case unableToObtain
        case invalid
    }
}
