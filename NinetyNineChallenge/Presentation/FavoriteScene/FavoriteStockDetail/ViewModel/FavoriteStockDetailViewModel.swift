//
//  FavoriteStockDetailViewModel.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 22/11/20.
//

import Foundation
import RxCocoa

// MARK: View model protocol
protocol FavoriteStockDetailViewModelProtocol: class {
    var isLoading: BehaviorRelay<Bool> { get }
    var error: BehaviorRelay<NNError?> { get }
    var useCase: FavoriteStockDetailUseCaseProtocol { get }
    var stockHot: BehaviorRelay<String> { get }
    var stockCategory: BehaviorRelay<String> { get }
    var stockCode: BehaviorRelay<String> { get }
    var stockName: BehaviorRelay<String> { get }
    var screenTitle: String { get }
    
    func start()
}

// MARK: View model implementation
final class FavoriteStockDetailViewModelImpl: FavoriteStockDetailViewModelProtocol {
    private(set) var isLoading: BehaviorRelay<Bool> = .init(value: false)
    private(set) var error: BehaviorRelay<NNError?> = .init(value: nil)
    private(set) var useCase: FavoriteStockDetailUseCaseProtocol
    private(set) var stockHot: BehaviorRelay<String> = .init(value: "")
    private(set) var stockCategory: BehaviorRelay<String> = .init(value: "")
    private(set) var stockCode: BehaviorRelay<String> = .init(value: "")
    private(set) var stockName: BehaviorRelay<String> = .init(value: "")
    var screenTitle: String { "Stock Details" }
    
    private var identifier: String
    
    init(useCase: FavoriteStockDetailUseCaseProtocol =
            FavoriteStockDetailUseCaseImpl(repository: FavoritesRepositoryImpl()),
         identifier: String) {
        self.useCase = useCase
        self.identifier = identifier
    }
    
    func start() {
        isLoading.toggle()
        useCase.fetch(withIdentifier: identifier) { [self] result in
            isLoading.toggle()
            switch result {
            case .success(let data):
                setData(data)
            case .failure(let error):
                self.error.accept(error)
            }
        }
    }
    
    private func setData(_ model: Stock) {
        stockHot.accept("\(model.hot)")
        stockCategory.accept(model.category.capitalized)
        stockCode.accept(model.reutersInstrumentCode)
        stockName.accept(model.name)
    }
}
