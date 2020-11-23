//
//  ItemInfoView.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 23/11/20.
//

import UIKit

class ItemInfoView: UIView {
    private lazy var titleLabel = SubtitleLabel(text: "")
    private lazy var valueLabel = UILabel()
    private lazy var containerStackView = UIStackView()
    
    convenience init(title: String) {
        self.init()
        titleLabel.text = title
        configure()
    }
    
    func setTitle(title: String) {
        titleLabel.text = title
    }
    
    func setValue(value: String) {
        valueLabel.text = value
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
