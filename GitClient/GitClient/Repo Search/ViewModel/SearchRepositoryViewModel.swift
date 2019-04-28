//
//  SearchRepositoryViewModel.swift
//  GitClient
//
//  Created by Saad El Oulladi on 26/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import RxCocoa
import RxSwift

protocol SearchRepositoryViewModelInterface: class {
    
    // MARK: - Inputs
    var searchSubject:PublishSubject<String> {get}
    var resultDriver:Driver<[Repository]> {get}
    var selectRepositoryObserver: AnyObserver<Repository> {get}

    // MARK: - Outputs
    var selectRepositoryObservable: Observable<Repository> {get}

}

class SearchRepositoryViewModel: SearchRepositoryViewModelInterface {
    
    private let api:ApiInterface
    private let coordinator:RepositorySearchCoordinatorInterface

    // MARK: - Inputs
    
    let selectRepositoryObserver: AnyObserver<Repository>
    // Fix me
    let searchSubject = PublishSubject<String>()


    // MARK: - Outputs
    let selectRepositoryObservable: Observable<Repository>
    
    lazy var resultDriver:Driver<[Repository]> = {
        return searchSubject.asObservable()
            .filter { !$0.isEmpty }
            .distinctUntilChanged()
            .debounce(0.3, scheduler: MainScheduler.instance)
            .flatMapLatest { [unowned self] searchText -> Observable<[Repository]> in
                return self.api.searchRepository(withQuery: searchText)
        }.asDriver(onErrorJustReturn: [])
    }()

    init(api: ApiInterface, coordinator:RepositorySearchCoordinatorInterface) {
        
        self.api = api
        self.coordinator = coordinator
        
        let selectRepositorySubject = PublishSubject<Repository>()
        selectRepositoryObserver = selectRepositorySubject.asObserver()
        selectRepositoryObservable = selectRepositorySubject.asObservable()
    }
    
}
