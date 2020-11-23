//
//  EnvironmentConfig.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 23/11/20.
//

import Foundation

enum Environment {
    enum Keys: String {
        case urlBase = "URL_BASE"
    }

    static func infoForKey(_ key: Keys) -> String {
        return (Bundle.main.infoDictionary?[key.rawValue] as? String)!.replacingOccurrences(of: ":/", with: "://")
    }
}
