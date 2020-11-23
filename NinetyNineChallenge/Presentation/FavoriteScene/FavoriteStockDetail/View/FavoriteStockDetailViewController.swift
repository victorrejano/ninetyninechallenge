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
    private lazy var containerView = UIStackView()
    private lazy var titleLabel = TitleLabel(text: "")
    private lazy var categoryItemInfo = ItemInfoView(title: "CATEGORY")
    private lazy var codeItemInfo = ItemInfoView(title: "RIC CODE")
    private lazy var hotItemInfo = ItemInfoView(title: "HOT")
    
    // MARK: Init
    convenience init(viewModel: FavoriteStockDetailViewModelProtocol) {
        self.init()
        self.viewModel = viewModel
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bind(to: viewModel)
        layoutUI()
    }
    
    // MARK: View model binding
    func bind(to viewModel: FavoriteStockDetailViewModelProtocol) {
        title = viewModel.screenTitle
        
        viewModel.stockName.asObservable().subscribe { [self] stockName in
            UIThread { titleLabel.text = stockName.element ?? "" }
        }.disposed(by: disposeBag)
        
        viewModel.stockCategory.asObservable().subscribe { [self] stockCategory in
            UIThread { categoryItemInfo.setValue(value: stockCategory.element ?? "") }
        }.disposed(by: disposeBag)
        
        viewModel.stockCode.asObservable().subscribe { [self] stockCode in
            UIThread { codeItemInfo.setValue(value: stockCode.element ?? "") }
        }.disposed(by: disposeBag)
        
        viewModel.stockHot.asObservable().subscribe { [self] stockHot in
            UIThread { hotItemInfo.setValue(value: stockHot.element ?? "")}
        }.disposed(by: disposeBag)
        
        viewModel.start()
    }
}

// MARK: UI Setup
private extension FavoriteStockDetailViewController {
    func layoutUI() {
        let itemInfoContainerView = UIStackView()
        itemInfoContainerView.axis = .horizontal
        itemInfoContainerView.distribution = .equalCentering
        itemInfoContainerView.addArrangedSubviews([categoryItemInfo, codeItemInfo, hotItemInfo])
        
        [containerView, itemInfoContainerView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        containerView.axis = .vertical
        containerView.distribution = .fillProportionally
        containerView.spacing = 10
        containerView.addArrangedSubviews([titleLabel, itemInfoContainerView])
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            containerView.heightAnchor.constraint(lessThanOrEqualToConstant: 100),
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding)
        ])
        
        view.backgroundColor = AppColor.background.value
    }
}
