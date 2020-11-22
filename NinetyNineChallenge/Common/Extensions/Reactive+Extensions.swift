//
//  Reactive+Extensions.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 22/11/20.
//

import RxCocoa

extension BehaviorRelay where Element == Bool {
    func toggle() {
        accept(!value)
    }
}
