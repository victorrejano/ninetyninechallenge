//
//  LoadingView.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 23/11/20.
//

import UIKit

final class LoadingView: UIView {
    // MARK: Views
    private var activityIndicatorView = UIActivityIndicatorView(style: .large)
    
    func start() {
        layoutUI()
        configureView()
    }
}

// MARK: UI Setup
private extension LoadingView {
    func layoutUI() {
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(activityIndicatorView)
        
        let size: CGFloat = 50
        
        NSLayoutConstraint.activate([
            activityIndicatorView.heightAnchor.constraint(equalToConstant: size),
            activityIndicatorView.widthAnchor.constraint(equalToConstant: size),
            activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func configureView() {
        activityIndicatorView.startAnimating()
        activityIndicatorView.color = AppColor.detail.value
        
        // Background shadow
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.50)
    }
}
