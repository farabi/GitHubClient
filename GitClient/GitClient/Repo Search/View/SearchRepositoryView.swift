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
        title = R.string.localizable.homeTitle()
        
        bindUIToViewModel()
     }
    
    func bindUIToViewModel()  {
        
        guard let viewModel = viewModel else {
            return
        }

        /// Observe searchBar input text
        searchBar.rx.text.orEmpty
            .bind(to: viewModel.searchObserver)
            .disposed(by: disposeBag)
        
        /// Bind tableview to results
        resultTableView.registerCellNib(withType: RepositoryTableViewCell.self)
        viewModel.resultDriver.drive(resultTableView.rx.items(cellIdentifier: RepositoryTableViewCell.reuseIdentifier,
                                                              cellType: RepositoryTableViewCell.self)) {  _, repository, cell in
                    cell.setViewModel(model: repository)
        }.disposed(by: disposeBag)
        
        /// Hide/Unhide results
        viewModel.resultHiddenObservable.bind(to: resultTableView.rx.isHidden).disposed(by: disposeBag)
        
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
