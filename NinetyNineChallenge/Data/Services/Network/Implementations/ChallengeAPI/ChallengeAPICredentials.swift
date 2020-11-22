//
//  ChallengeAPICredentials.swift
//  NinetyNineChallenge
//
//  Credentials needed to connect to Challenge API
//  Default implementation could be changed pending of environment, for instance aim to a development
//  server or production one
//
//  Created by Victor Rejano on 22/11/20.
//

import Foundation

protocol ChallengeAPICredentialsProtocol {
    var urlBase: URL { get }
}

struct ChallengeAPICredentials: ChallengeAPICredentialsProtocol {
    var urlBase: URL { URL(string: "https://challenge.ninetynine.com")! }
}
