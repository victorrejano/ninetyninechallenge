//
//  FavoriteListViewController.swift
//  NinetyNineChallenge
//
//  Created by Victor Rejano on 22/11/20.
//

import UIKit
import RxCocoa
import RxSwift

final class FavoriteListViewController: UIViewController {
    // MARK: Dependencies
    private var viewModel: FavoriteListViewModelProtocol!
    
    // MARK: Binding
    private let disposeBag = DisposeBag()
    
    // MARK: Views
    private lazy var tableView = UITableView()
    
    // MARK: Init
    convenience init(viewModel: FavoriteListViewModelProtocol) {
        self.init()
        self.viewModel = viewModel
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bind(to: viewModel)
        layoutUI()
        configureTableView()
    }
    
    // MARK: View model binding
    func bind(to viewModel: FavoriteListViewModelProtocol) {
        title = viewModel.screenTitle
        
        viewModel.items.asObservable().subscribe { [self] items in
            UIThread { self.tableView.reloadData() }
        }.disposed(by: disposeBag)
        
        viewModel.error.asObservable().subscribe { [self] error in
            guard let error = error.element, error != nil else { return }
            UIThread { showAlertError(with: error!) }
        }.disposed(by: disposeBag)
        
        viewModel.isLoading.asObservable().subscribe { [self] isLoading in
            UIThread { isLoading == true ? showLoadingView() : dismissLoadingView() }
        }.disposed(by: disposeBag)
        
        viewModel.start()
    }
}

// MARK: UI Setup
private extension FavoriteListViewController {
    func layoutUI() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
    
    func configureTableView() {
        tableView.register(for: FavoriteItemTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 80
        tableView.tableFooterView = UIView()
    }
}

// MARK: TableView data source
extension FavoriteListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(for: FavoriteItemTableViewCell.self) else { return UITableViewCell() }
        return prepareCell(cell, at: indexPath)
    }
    
    private func prepareCell(_ cell: FavoriteItemTableViewCell, at indexPath: IndexPath) -> FavoriteItemTableViewCell {
        let itemViewModel = viewModel.items.value[indexPath.row]
        
        // Bind cell to viewModel and setup event for remove item
        cell.bind(to: itemViewModel) { [self] cell in
            guard let indexPath = tableView.indexPath(for: cell) else { return }
            viewModel.didRemove(at: indexPath)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
        
        return cell
    }
}

// MARK: TableView delegate
extension FavoriteListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelect(at: indexPath)
    }
}
