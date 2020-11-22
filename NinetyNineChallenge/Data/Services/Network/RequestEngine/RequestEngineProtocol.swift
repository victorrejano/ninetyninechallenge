//
//  RequestEngineProtocol.swift
//  NinetyNineChallenge
//
//  This protocol will be implemented by our desired request executer implementation,
//  could be a wrapper for Alamofire, URLSession or whatever
//
//  Created by Victor Rejano on 22/11/20.
//

import Foundation

protocol RequestEngineProtocol: class {
    func execute<T: Decodable>(_ request: URLRequest,
                               for type: T.Type,
                               _ completion: @escaping (Result<T, NNError>) -> Void)
}
