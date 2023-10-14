//
//  ViewModel.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 14/10/23.
//

import Foundation
import RxSwift

protocol ViewModelInputProtocol {}
protocol ViewModelOutputProtocol {}

protocol ViewModelProtocol: AnyObject {
    var router: RouterProtocol? { get }
    var ownerLifeCycleStatus: PublishSubject<ViewModelOwnerLifecycleStatus> { get }
    var status: Observable<ViewModelStatus> { get }
    
    var input: ViewModelInputProtocol { get }
    var output: ViewModelOutputProtocol { get }
    
    func setup()
}

extension ViewModelProtocol {
    var router: RouterProtocol? { nil }
}

enum ViewModelOwnerLifecycleStatus {
    case viewDidLoad
    case viewWillAppear
    case viewDidAppear
    case viewWillDisappear
}

enum ViewModelStatus {
    case loading
    case loaded
    case error(NNError)
    case alert(title: String, message: String)
}

protocol ViewModelOwnerProtocol {
    var viewModel: ViewModelProtocol! { get }
    
    func bind(to: ViewModelProtocol)
}
