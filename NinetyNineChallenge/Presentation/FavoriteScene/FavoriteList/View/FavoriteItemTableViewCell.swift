//
//  FavoriteItemTableViewCell.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 22/11/20.
//

import UIKit

class FavoriteItemTableViewCell: UITableViewCell {
    private lazy var titleLabel = TitleLabel(text: "")
    private lazy var removeButton = UIButton()
    private var onRemoveButtonTapped: (UITableViewCell) -> Void = { _ in }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutUI() {
        addSubview(titleLabel)
        contentView.addSubview(removeButton)
        
        removeButton.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            removeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            removeButton.widthAnchor.constraint(equalToConstant: 40),
            removeButton.widthAnchor.constraint(equalToConstant: 40),
            removeButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: removeButton.trailingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        selectionStyle = .none
        accessoryType = .detailDisclosureButton
        
        removeButton.setImage(UIImage(systemName: "trash"), for: .normal)
        removeButton.tintColor = AppColor.detail.value
        removeButton.addTarget(self, action: #selector(removeButtonTapped), for: .touchUpInside)
    }
    
    func bind(to viewModel: FavoriteItemViewModelProtocol,
              onRemoveButtonTapped: @escaping (UITableViewCell) -> Void) {
        titleLabel.text = viewModel.title
        self.onRemoveButtonTapped = onRemoveButtonTapped
    }
    
    @objc private func removeButtonTapped() {
        onRemoveButtonTapped(self)
    }
}
