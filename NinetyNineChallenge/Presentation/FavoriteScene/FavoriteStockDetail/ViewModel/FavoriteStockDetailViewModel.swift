//
//  FavoriteStockDetailViewModel.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 22/11/20.
//

import Foundation
import RxCocoa
import RxSwift

// MARK: View model protocol
protocol FavoriteStockDetailViewModelProtocol: AnyObject, ViewModelProtocol {}

struct FavoriteStockDetailViewModelOutput: ViewModelOutputProtocol {
    var screenTitle: String
    var stockCategory: Observable<String>
    var stockCode: Observable<String>
    var stockHot: Observable<String>
    var stockName: Observable<String>
}

struct FavoriteStockDetailViewModelInput: ViewModelInputProtocol {}

// MARK: View model implementation
final class FavoriteStockDetailViewModelImpl: FavoriteStockDetailViewModelProtocol {
    private var disposeBag = DisposeBag()
    
    var ownerLifeCycleStatus: PublishSubject<ViewModelOwnerLifecycleStatus> = PublishSubject()
    var status: Observable<ViewModelStatus>
    
    var input: ViewModelInputProtocol
    var output: ViewModelOutputProtocol
    
    private var useCase: FavoriteStockDetailUseCaseProtocol
    private var identifier: String
    private var screenTitle = "Stock Details"
    
    private var viewModelStatusSubject = PublishSubject<ViewModelStatus>()
    private var stockCategorySubject = PublishSubject<String>()
    private var stockCodeSubject = PublishSubject<String>()
    private var stockHotSubject = PublishSubject<String>()
    private var stockNameSubject = PublishSubject<String>()
    
    init(useCase: FavoriteStockDetailUseCaseProtocol =
         FavoriteStockDetailUseCaseImpl(repository: FavoritesRepositoryImpl()),
         identifier: String) {
        self.useCase = useCase
        self.identifier = identifier
        self.status = viewModelStatusSubject.asObservable()
        
        input = FavoriteStockDetailViewModelInput()
        output = FavoriteStockDetailViewModelOutput(
            screenTitle: screenTitle,
            stockCategory: stockCategorySubject.observeOn(MainScheduler.asyncInstance),
            stockCode: stockCodeSubject.observeOn(MainScheduler.asyncInstance),
            stockHot: stockHotSubject.observeOn(MainScheduler.asyncInstance),
            stockName: stockNameSubject.observeOn(MainScheduler.asyncInstance)
        )
        
        setup()
    }
    
    func setup() {
        ownerLifeCycleStatus.subscribe(onNext: { [weak self] status in
            switch status {
            case .viewWillAppear:
                self?.viewModelStatusSubject.onNext(.loading)
                self?.loadData()
            default:
                break
            }
        })
        .disposed(by: disposeBag)
    }
    
    private func loadData() {
        useCase.fetch(withIdentifier: identifier) { [weak self] result in
            self?.viewModelStatusSubject.onNext(.loaded)
            
            switch result {
            case let .success(stock):
                self?.setData(stock)
            case let .failure(error):
                self?.viewModelStatusSubject.onNext(.error(error))
            }
        }
    }
    
    private func setData(_ stock: Stock) {
        stockCategorySubject.onNext(stock.category)
        stockCodeSubject.onNext(stock.reutersInstrumentCode)
        stockHotSubject.onNext("\(stock.hot)")
        stockNameSubject.onNext(stock.name)
    }
}
