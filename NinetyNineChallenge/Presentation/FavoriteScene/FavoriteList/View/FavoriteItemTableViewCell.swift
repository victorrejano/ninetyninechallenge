//
//  FavoriteItemTableViewCell.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 22/11/20.
//

import UIKit

class FavoriteItemTableViewCell: UITableViewCell {
    private lazy var titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutUI() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        selectionStyle = .none
        accessoryType = .detailDisclosureButton
    }
    
    func bind(to viewModel: FavoriteItemViewModelProtocol) {
        titleLabel.text = viewModel.title
    }
}
