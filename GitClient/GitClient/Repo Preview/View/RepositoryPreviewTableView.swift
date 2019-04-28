//
//  RepositoryPreviewTableView.swift
//  GitClient
//
//  Created by Saad El Oulladi on 28/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import XLPagerTabStrip
import RxCocoa
import RxSwift

protocol RepositoryPreviewCell where Self: UITableViewCell {
    func setViewModel(model:Codable)
}

class RepositoryPreviewTableView<Model, PreviewCell>: UITableViewController, IndicatorInfoProvider  where Model: Codable, PreviewCell: RepositoryPreviewCell {
    
    private let disposeBag = DisposeBag()
    
    public var viewModel:RepositoryPreviewListViewModel<Model>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let viewModel = viewModel else {
            return
        }
        
        /// Empty existing delegates.
        tableView.delegate = nil
        tableView.dataSource = nil

        /// Bind content tableView to listDataDriver.
        tableView.registerCell(PreviewCell.self)
        viewModel.listDataDriver.drive(tableView.rx.items(cellIdentifier: PreviewCell.reuseIdentifier,
                                                          cellType: PreviewCell.self)){  _, model, cell in
                cell.setViewModel(model: model)
        }.disposed(by: disposeBag)
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: viewModel?.previewListTitle)
    }
}
