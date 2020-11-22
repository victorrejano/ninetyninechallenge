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
    
    // MARK: Data source
    private var items: [FavoriteItemViewModelProtocol] = [] { didSet { self.tableView.reloadData() }}
    
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
            UIThread { self.items = items.element ?? [] }
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
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(for: FavoriteItemTableViewCell.self) else { return UITableViewCell()
        }
        let itemViewModel = viewModel.items.value[indexPath.row]
        cell.bind(to: itemViewModel)
        return cell
    }
}

// MARK: TableView delegate
extension FavoriteListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelect(at: indexPath)
    }
}
