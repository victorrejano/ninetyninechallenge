//
//  Thread+Extensions.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 22/11/20.
//

import Foundation

// MARK: UIThread syntax sugar
func UIThread(_ action: @escaping () -> Void) { DispatchQueue.main.async { action() }}
