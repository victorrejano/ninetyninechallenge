//
//  NNError.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 22/11/20.
//

import Foundation

enum NNError: Error {
    case data(Data)
    case network(Error)
    case custom(String)
    case unknown(Error)
    
    enum Data {
        case unableToObtain
        case invalid
    }
}
