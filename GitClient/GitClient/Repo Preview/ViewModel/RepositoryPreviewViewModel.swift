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
    var informationsTitle: String {get}
    var collaboratorsViewModel: RepositoryPreviewListViewModel<User> {get}
    var issuesViewModel: RepositoryPreviewListViewModel<Issue> {get}
    var pullRequetsViewModel: RepositoryPreviewListViewModel<Issue> {get}
}

class RepositoryPreviewViewModel: RepositoryPreviewViewModellInterface {
    
    private let api:ApiInterface
    private let coordinator:RepositoryPreviewCoordinator
    private let repository:Repository
    
    let informationsTitle: String
    
    let collaboratorsViewModel: RepositoryPreviewListViewModel<User>
    let issuesViewModel: RepositoryPreviewListViewModel<Issue>
    let pullRequetsViewModel: RepositoryPreviewListViewModel<Issue>

    init(repository: Repository, api: ApiInterface, coordinator:RepositoryPreviewCoordinator) {
        
        self.api = api
        self.coordinator = coordinator
        self.repository = repository
        
        let collaboratorsObseravle = api.fetchContributors(byRepositoryName: repository.fullName)
        collaboratorsViewModel = RepositoryPreviewListViewModel(apiCallObservable: collaboratorsObseravle,
                                                                previewListTitle: R.string.localizable.repositoryPreviewContributors())
        
        let issuesObseravle = api.fetchIssues(byRepositoryName: repository.fullName)
        issuesViewModel = RepositoryPreviewListViewModel(apiCallObservable: issuesObseravle,
                                                                previewListTitle: R.string.localizable.repositoryPreviewIssues())
        
        let pullRequetsObseravle = api.fetchPullRequets(byRepositoryName: repository.fullName)
        pullRequetsViewModel = RepositoryPreviewListViewModel(apiCallObservable: pullRequetsObseravle,
                                                         previewListTitle: R.string.localizable.repositoryPreviewPullRequests())
        
        informationsTitle = R.string.localizable.repositoryPreviewInformations()
    }
    
}
