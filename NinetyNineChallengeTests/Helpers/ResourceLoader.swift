//
//  ResourceLoader.swift
//  NinetyNineChallengeTests
//
//  Created by Victor Rejano on 22/11/20.
//

import Foundation

enum ResourceLoader {
    static func loadData(name: String, format: String = "json") -> Data? {
        let bundle = ClassForBundle.bundle()
        let path = bundle.path(forResource: name, ofType: format)!
        return FileManager.default.contents(atPath: path)
    }
    
    static func load<T: Decodable>(type: T.Type, name: String) -> T? {
        let data = loadData(name: name)!
        return try? JSONDecoder().decode(type, from: data)
    }
    
    private class ClassForBundle {
        static func bundle() -> Bundle {
            return Bundle(for: type(of: ClassForBundle()))
        }
    }
}
