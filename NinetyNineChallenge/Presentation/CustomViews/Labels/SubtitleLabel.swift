//
//  SubtitleLabel.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 23/11/20.
//

import UIKit

class SubtitleLabel: UILabel {
    convenience init(text: String = "") {
        self.init()
        self.text = text
        configure()
    }
    
    private func configure() {
        font = AppFont.subtitle.value
        textColor = .systemGray
        translatesAutoresizingMaskIntoConstraints = false
    }
}
