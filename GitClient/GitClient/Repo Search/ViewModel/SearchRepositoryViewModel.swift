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
    var searchObserver:AnyObserver<String> {get}
    var selectRepositoryObserver: AnyObserver<Repository> {get}

    // MARK: - Outputs
    var resultDriver:Driver<[Repository]> {get}
    var selectRepositoryObservable: Observable<Repository> {get}
    var alertObservable: Observable<String> {get}
    var resultHiddenObservable: Observable<Bool> {get}
    var loadingObservable: Observable<Bool> {get}
}

class SearchRepositoryViewModel: SearchRepositoryViewModelInterface {

    // MARK: - Inputs
    let selectRepositoryObserver: AnyObserver<Repository>
    let searchObserver: AnyObserver<String>
    
    // MARK: - Outputs
    let selectRepositoryObservable: Observable<Repository>
    let resultDriver:Driver<[Repository]>
    let alertObservable: Observable<String>
    let resultHiddenObservable: Observable<Bool>
    let loadingObservable: Observable<Bool>

    private let coordinator:Coordinator

    init(api: ApiInterface, coordinator:Coordinator) {
        self.coordinator = coordinator
        
        let alertSubject = PublishSubject<String>()
        alertObservable = alertSubject.asObservable()

        let resultHiddenSubject = PublishSubject<Bool>()
        resultHiddenObservable = resultHiddenSubject.asObservable()
        
        let loadingReplay = BehaviorRelay<Bool>(value: false)
        loadingObservable = loadingReplay.asObservable()

        let searchSubject = PublishSubject<String>()
        searchObserver = searchSubject.asObserver()
        resultDriver = searchSubject.asObservable()
                                    .startWith("")
                                    .distinctUntilChanged()
                                    .debounce(0.3, scheduler: MainScheduler.instance)
                                    .do(onNext: { _ in
                                        loadingReplay.accept(true)
                                    })
                                    .flatMapLatest { searchText -> Observable<[Repository]> in
                                        return api.searchRepository(withQuery: searchText).catchError({ (error) in
                                            alertSubject.onNext(error.localizedDescription)
                                            return Observable.just([])
                                        })
                                    }.do(onNext: { repositories in
                                        resultHiddenSubject.onNext(repositories.count == 0)
                                        loadingReplay.accept(false)
                                    }).asDriver(onErrorJustReturn: [])
        
        let selectRepositorySubject = PublishSubject<Repository>()
        selectRepositoryObserver = selectRepositorySubject.asObserver()
        selectRepositoryObservable = selectRepositorySubject.asObservable()
    }
    
}
