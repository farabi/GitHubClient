//
//  RepositoryPreviewViewModel.swift
//  GitClient
//
//  Created by Saad El Oulladi on 27/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import RxCocoa
import RxSwift


protocol RepositoryPreviewViewModellInterface: class {
    
}

class RepositoryPreviewListViewModel<Model> where Model: Codable {

    let listDataDriver:Driver<[Model]>

    init(apiCallObservable: Observable<[Model]>) {
        listDataDriver = apiCallObservable.asDriver(onErrorJustReturn: [])
    }
}

class RepositoryPreviewViewModel: RepositoryPreviewViewModellInterface {
    
    private var api:ApiInterface
    private let coordinator:RepositoryPreviewCoordinator
    private let repository:Repository
    
    private let collaboratorsViewModel: RepositoryPreviewListViewModel<User>

    init(repository: Repository, api: ApiInterface, coordinator:RepositoryPreviewCoordinator) {
        
        self.api = api
        self.coordinator = coordinator
        self.repository = repository
        
        let collaboratorsObseravle = api.fetchContributors(byRepositoryName: repository.fullName)
        collaboratorsViewModel = RepositoryPreviewListViewModel(apiCallObservable: collaboratorsObseravle)
    }
    
}
