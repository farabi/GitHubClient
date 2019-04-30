//
//  SearchRepositoryView.swift
//  GitClient
//
//  Created by Saad El Oulladi on 26/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import RxCocoa
import RxSwift

class SearchRepositoryView: UIViewController {
    
    var viewModel:SearchRepositoryViewModelInterface?
    
    @IBOutlet weak private var searchBar: UISearchBar!
    @IBOutlet weak private var resultTableView: UITableView!
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let viewModel = viewModel else {
            return
        }
        
        searchBar.rx.text.orEmpty
            .bind(to: viewModel.searchObserver)
            .disposed(by: disposeBag)
    
        resultTableView.registerCell(Type: UITableViewCell.self)
        viewModel.resultDriver.drive(resultTableView.rx.items(cellIdentifier: UITableViewCell.reuseIdentifier,
                                                              cellType: UITableViewCell.self)) {  _, repository, cell in
                cell.textLabel?.text = repository.name
        }.disposed(by: disposeBag)
        
        /// AKA didSelectRowAtIndexPath
        resultTableView.rx.modelSelected(Repository.self)
            .bind(to:viewModel.selectRepositoryObserver)
            .disposed(by: disposeBag)
        
         #warning("Fix alert message")
        viewModel.alertObservable.subscribe { [weak self] in
            self?.alert(withMessage: "test")
        }.disposed(by: disposeBag)
    }
    
}
