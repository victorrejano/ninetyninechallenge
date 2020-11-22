//
//  MockURLProtocol.swift
//  NinetyNineChallengeTests
//
//  Created by Victor Rejano on 22/11/20.
//

import Foundation

// MARK: Mock URL Protocol to intercept requests
class MockURLProtocol: URLProtocol {
    static var testURLs = [String: Data]()
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        if let url = request.url?.path,
           let data = MockURLProtocol.testURLs[url] {
            self.client?.urlProtocol(self, didLoad: data)
        }
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    // this method is required but doesn't needed
    override func stopLoading() { }
}
