//
//  TitleLabel.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 23/11/20.
//

import UIKit

class TitleLabel: UILabel {
    convenience init(text: String = "") {
        self.init()
        self.text = text
        configure()
    }
    
    private func configure() {
        font = AppFont.title.value
        translatesAutoresizingMaskIntoConstraints = false
    }
}
