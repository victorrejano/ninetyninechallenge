//
//  AppAppearance.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 23/11/20.
//

import UIKit

func loadTheme() {
    // Navigation bar
    UINavigationBar.appearance().prefersLargeTitles = true
    UINavigationBar.appearance().tintColor = AppColor.detail.value
    
    // TableView
    UITableViewCell.appearance().tintColor = AppColor.detail.value
}
