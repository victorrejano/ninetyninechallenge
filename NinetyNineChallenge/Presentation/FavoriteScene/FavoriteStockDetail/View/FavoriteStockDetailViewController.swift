//
//  FavoriteStockDetailViewController.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 22/11/20.
//

import UIKit
import RxCocoa
import RxSwift

final class FavoriteStockDetailViewController: UIViewController {
    // MARK: Dependencies
    private var viewModel: FavoriteStockDetailViewModelProtocol!
    
    // MARK: Binding
    private let disposeBag = DisposeBag()
    
    // MARK: Views
    
    // MARK: Init
    convenience init(viewModel: FavoriteStockDetailViewModelProtocol) {
        self.init()
        self.viewModel = viewModel
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bind(to: viewModel)
    }
    
    // MARK: View model binding
    func bind(to viewModel: FavoriteStockDetailViewModelProtocol) {
        title = viewModel.screenTitle
        
        viewModel.stockName.asObservable().subscribe { [self] stockName in
            UIThread {  }
        }.disposed(by: disposeBag)
        
        viewModel.stockCategory.asObservable().subscribe { [self] stockCategory in
            UIThread {  }
        }.disposed(by: disposeBag)
        
        viewModel.stockCode.asObservable().subscribe { [self] stockCode in
            UIThread {  }
        }.disposed(by: disposeBag)
        
        viewModel.stockHot.asObservable().subscribe { [self] stockHot in
            UIThread { }
        }.disposed(by: disposeBag)
        
        viewModel.start()
    }
}

// MARK: UI Setup
private extension FavoriteStockDetailViewController {
    func layoutUI() {
    }
}
