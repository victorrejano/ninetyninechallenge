//
//  UITableView+RelatedExtensions.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 22/11/20.
//

import UIKit

// MARK: Identifiable protocol for tableViewCells
protocol CellIdentifiable: AnyObject {
    static var reuseIdentifier: String { get }
}

extension CellIdentifiable {
    static var reuseIdentifier: String { "\(Self.self)" }
}

extension UITableViewCell: CellIdentifiable {}

// MARK: Cell registration and dequeue
extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(for type: T.Type) -> T? {
        self.dequeueReusableCell(withIdentifier: type.reuseIdentifier) as? T
    }
    func register<T: UITableViewCell>(for type: T.Type) {
        self.register(type.self, forCellReuseIdentifier: type.reuseIdentifier)
    }
}

