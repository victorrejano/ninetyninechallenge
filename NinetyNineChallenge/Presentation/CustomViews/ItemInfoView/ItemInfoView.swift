//
//  ItemInfoView.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 23/11/20.
//

import UIKit

class ItemInfoView: UIView {
    private(set) lazy var titleLabel = SubtitleLabel(text: "")
    private(set) lazy var valueLabel = UILabel()
    private lazy var containerStackView = UIStackView()
    
    convenience init(title: String) {
        self.init()
        titleLabel.text = title
        configure()
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(containerStackView)
        
        containerStackView.axis = .vertical
        containerStackView.distribution = .equalCentering
        
        containerStackView.addArrangedSubview(titleLabel)
        containerStackView.addArrangedSubview(valueLabel)
        
        containerStackView.pinToEdges(of: self)
        
        valueLabel.font = .boldSystemFont(ofSize: 14)
    }
}
