//
//  ViewController.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 14/10/23.
//

import UIKit
import RxSwift

open class ViewController: UIViewController, ViewModelOwnerProtocol {
    var viewModel: ViewModelProtocol!
    private var disposeBag = DisposeBag()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.ownerLifeCycleStatus.onNext(.viewDidLoad)
        bind(to: viewModel)
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.ownerLifeCycleStatus.onNext(.viewWillAppear)
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.ownerLifeCycleStatus.onNext(.viewDidAppear)
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.ownerLifeCycleStatus.onNext(.viewWillDisappear)
    }
    
    func bind(to: ViewModelProtocol) {
        viewModel.status
            .subscribeOn(MainScheduler.asyncInstance)
            .subscribe(onNext: { [weak self] status in
                switch status {
                case .loading:
                    self?.showLoadingView()
                case .loaded:
                    self?.dismissLoadingView()
                case let .error(error):
                    self?.showAlertError(with: error)
                case let .alert(title, message):
                    self?.showAlertInfo(title: title, message: message)
                }
        })
        .disposed(by: disposeBag)
    }
}
