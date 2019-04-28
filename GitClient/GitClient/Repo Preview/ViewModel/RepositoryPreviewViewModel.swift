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
    var collaboratorsViewModel: RepositoryPreviewListViewModel<User> {get}
}

class RepositoryPreviewViewModel: RepositoryPreviewViewModellInterface {
    
    private let api:ApiInterface
    private let coordinator:RepositoryPreviewCoordinator
    private let repository:Repository
    
    let collaboratorsViewModel: RepositoryPreviewListViewModel<User>

    init(repository: Repository, api: ApiInterface, coordinator:RepositoryPreviewCoordinator) {
        
        self.api = api
        self.coordinator = coordinator
        self.repository = repository
        
        let collaboratorsObseravle = api.fetchContributors(byRepositoryName: repository.fullName)
        collaboratorsViewModel = RepositoryPreviewListViewModel(apiCallObservable: collaboratorsObseravle,
                                                                previewListTitle: R.string.localizable.repositoryPreviewContributors())
    }
    
}
