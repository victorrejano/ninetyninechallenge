//
//  RequestEndpointProtocol.swift
//  NinetyNineChallenge
//
//  This protocol will be implemented by any object responsible to provide an endpoint
//
//  Created by Victor Rejano on 22/11/20.
//

import Foundation

protocol RequestEndpointProtocol {
    func path(urlBase: URL) -> URL
}
