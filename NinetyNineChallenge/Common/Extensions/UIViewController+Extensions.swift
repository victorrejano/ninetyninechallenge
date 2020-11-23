//
//  UIViewController+Extensions.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 23/11/20.
//

import UIKit

// MARK: Loading view
extension UIViewController {
    func showLoadingView() {
        let activityIndicator = LoadingView(frame: view.frame)
        activityIndicator.start()
        self.view.addSubview(activityIndicator)
    }
    
    func dismissLoadingView() {
        view.subviews.first { $0 is LoadingView }?.removeFromSuperview()
    }
}

// MARK: Alert view
extension UIViewController {
    func showAlertInfo(title: String, message: String) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel))
        self.present(alertController, animated: true)
    }
    
    func showAlertError(with error: NNError) {
        showAlertInfo(title: "An error has ocurred!",
                      message: error.description)
    }
}
