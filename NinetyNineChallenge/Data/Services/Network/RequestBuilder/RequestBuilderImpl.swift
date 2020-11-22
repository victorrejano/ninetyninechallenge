//
//  RequestBuilderImpl.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 22/11/20.
//

import Foundation

class RequestBuilderImpl: RequestBuilderProtocol {
    private(set) var urlBase: URL
    private var method: HttpMethod = .GET
    private var url: URL?
    
    init(urlBase: URL) {
        self.urlBase = urlBase
    }
    
    @discardableResult
    func setEndpoint<T>(_ endpoint: T) -> Self where T : RequestEndpointProtocol {
        url = endpoint.path(urlBase: urlBase)
        return self
    }
    
    @discardableResult
    func setMethod(_ method: HttpMethod = .GET) -> Self {
        self.method = method
        return self
    }
    
    func build() throws -> URLRequest {
        guard let unwrappedURL = url else { throw NNError.data(.unableToObtain) }
        
        guard let urlComponents = URLComponents(url: unwrappedURL, resolvingAgainstBaseURL: true),
              let composedURL = urlComponents.url else { throw NNError.data(.invalid) }
        
        var urlRequest = URLRequest(url: composedURL)
        urlRequest.httpMethod = method.rawValue.capitalized
        
        return urlRequest
    }
}
