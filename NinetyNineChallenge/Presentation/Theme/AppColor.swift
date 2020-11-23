//
//  AppColor.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 23/11/20.
//

import UIKit

enum AppColor {
    case detail
    case background
    
    var value: UIColor {
        switch self {
        case .detail:
            return .systemPurple
        case .background:
            return .systemBackground
        }
    }
}
