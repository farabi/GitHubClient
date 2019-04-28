//
//  RepositoryPreviewTableView.swift
//  GitClient
//
//  Created by Saad El Oulladi on 27/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import XLPagerTabStrip
import RxCocoa
import RxSwift

class RepositoryPreviewTableView<Model>: UIViewController, IndicatorInfoProvider  where Model: Codable {
    
    @IBOutlet weak private var tableView: UITableView!
    private let disposeBag = DisposeBag()

    public var viewModel:RepositoryPreviewListViewModel<Model>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let viewModel = viewModel else {
            return
        }
        
        tableView.registerCell(UITableViewCell.self)
        viewModel.listDataDriver.drive(tableView.rx.items(cellIdentifier: UITableViewCell.reuseIdentifier,
                                                          cellType: UITableViewCell.self)){  _, model, cell in
                                                            cell.textLabel?.text = "test"
            }.disposed(by: disposeBag)
        /*viewModel.listDataDriver.drive(tableView.rx.items(cellIdentifier: UITableViewCell.reuseIdentifier,
                                                              cellType: UITableViewCell.self)) {  _, repository, cell in
                                                                cell.textLabel?.text = repository.name
            }.disposed(by: disposeBag)*/
    }

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: R.string.localizable.repositoryPreviewContributors())
    }

}
