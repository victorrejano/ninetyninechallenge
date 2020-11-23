//
//  AppFont.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 23/11/20.
//

import UIKit

enum AppFont {
    case title
    case subtitle
    case regular
    
    var value: UIFont {
        switch self {
        case .title:
            return .boldSystemFont(ofSize: 20)
        case .subtitle:
            return .systemFont(ofSize: 16)
        case .regular:
            return .systemFont(ofSize: 14)
        }
    }
}
