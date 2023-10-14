//
//  RequestBuilderProtocol.swift
//  NinetyNineChallenge
//
//  This protocol will be implemented by our request builder, if needed we can add parameters,
//  headers, etc... and finally we will obtain a URLRequest ready to be executed
//
//  Created by Victor Rejano on 22/11/20.
//

import Foundation

protocol RequestBuilderProtocol: AnyObject {
    var urlBase: URL { get }
    @discardableResult
    func setEndpoint<T: RequestEndpointProtocol>(_ endpoint: T) -> Self
    @discardableResult
    func setMethod(_ method: HttpMethod) -> Self
    @discardableResult
    func setCachePolicy(_ policy: URLRequest.CachePolicy) -> Self
    func build() throws -> URLRequest
}

enum HttpMethod: String {
    case GET
}
