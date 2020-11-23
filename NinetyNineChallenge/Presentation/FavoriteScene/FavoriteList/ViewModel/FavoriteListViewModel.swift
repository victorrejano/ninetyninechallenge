//
//  FavoriteListViewModel.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 22/11/20.
//

import Foundation
import RxCocoa

// MARK: View model protocol
protocol FavoriteListViewModelProtocol: class {
    var items: BehaviorRelay<[FavoriteItemViewModelProtocol]> { get }
    var isLoading: BehaviorRelay<Bool> { get }
    var error: BehaviorRelay<NNError?> { get }
    var useCase: FavoriteStocksListUseCaseProtocol { get }
    var screenTitle: String { get }
    var router: RouterProtocol { get }
    
    func start()
    func didSelect(at indexPath: IndexPath)
}

// MARK: View model implementation
final class FavoriteListViewModelImpl: FavoriteListViewModelProtocol {
    private(set) var items: BehaviorRelay<[FavoriteItemViewModelProtocol]> = .init(value: [])
    private(set) var isLoading: BehaviorRelay<Bool> = .init(value: false)
    private(set) var error: BehaviorRelay<NNError?> = .init(value: nil)
    private(set) var useCase: FavoriteStocksListUseCaseProtocol
    var screenTitle: String { "Favorites" }
    var router: RouterProtocol
    
    init(useCase: FavoriteStocksListUseCaseProtocol =
            FavoriteStocksListUseCaseImpl(repository: FavoritesRepositoryImpl()),
         router: RouterProtocol) {
        self.useCase = useCase
        self.router = router
    }
    
    func start() {
        useCase.fetch { [self] result in
            switch result {
            case .success(let data):
                self.items.accept(data.map { FavoriteItemViewModelImpl(with: $0) })
            case .failure(let error):
                self.error.accept(error)
            }
        }
    }
    
    func didSelect(at indexPath: IndexPath) {
        router.show(module: .favoriteDetail(items.value[indexPath.row].title))
    }
}
