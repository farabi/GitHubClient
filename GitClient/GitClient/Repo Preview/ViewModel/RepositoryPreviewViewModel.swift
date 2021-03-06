//
//  RepositoryPreviewViewModel.swift
//  GitClient
//
//  Created by Saad El Oulladi on 27/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import RxCocoa
import RxSwift

protocol RepositoryInformationsInterface: class {
    var informationsTitle: String {get}
    var repositoryFullNameObservable: Observable<String> {get}
    var repositoryDescriptionObservable: Observable<String> {get}
    var repositoryOwnerObservable: Observable<String> {get}
    var repositoryStarsObservable: Observable<String> {get}
    var repositoryForksObservable: Observable<String> {get}
    var repositoryOwnerAvatar: Observable<UIImage> {get}
}

protocol RepositoryListsViewModellInterface: class {
    var repositoryName: String {get}
    var collaboratorsViewModel: RepositoryPreviewListViewModel<User> {get}
    var issuesViewModel: RepositoryPreviewListViewModel<Issue> {get}
    var pullRequetsViewModel: RepositoryPreviewListViewModel<Issue> {get}
}

class RepositoryPreviewViewModel: RepositoryListsViewModellInterface, RepositoryInformationsInterface {
    
    private let api:ApiInterface
    private let coordinator:Coordinator
    private let repository:Repository
    
    let informationsTitle: String
    let repositoryName: String

    let repositoryFullNameObservable: Observable<String>
    let repositoryDescriptionObservable: Observable<String>
    let repositoryOwnerObservable: Observable<String>
    let repositoryStarsObservable: Observable<String>
    let repositoryForksObservable: Observable<String>
    let repositoryOwnerAvatar: Observable<UIImage>

    let collaboratorsViewModel: RepositoryPreviewListViewModel<User>
    let issuesViewModel: RepositoryPreviewListViewModel<Issue>
    let pullRequetsViewModel: RepositoryPreviewListViewModel<Issue>

    init(repository: Repository, api: ApiInterface, coordinator:Coordinator) {
        
        self.api = api
        self.coordinator = coordinator
        self.repository = repository
        
        repositoryName = repository.name
        repositoryFullNameObservable = Observable.just(repository.fullName)
        repositoryDescriptionObservable = Observable.just(repository.description)
        repositoryOwnerObservable = Observable.just(R.string.localizable.repositoryPreviewOwner()+repository.owner.login)
        repositoryStarsObservable = Observable.just("\(repository.starsCount)")
        repositoryForksObservable = Observable.just("\(repository.forksCount)")
        repositoryOwnerAvatar = api.fetchRemoteImage(withUrl: repository.owner.avatarUrlString)
        
        let collaboratorsObseravle = api.fetchContributors(byRepositoryName: repository.fullName)
        collaboratorsViewModel = RepositoryPreviewListViewModel(apiCallObservable: collaboratorsObseravle,
                                                                previewListTitle: R.string.localizable.repositoryPreviewContributions())
        
        let issuesObseravle = api.fetchIssues(byRepositoryName: repository.fullName)
        issuesViewModel = RepositoryPreviewListViewModel(apiCallObservable: issuesObseravle,
                                                                previewListTitle: R.string.localizable.repositoryPreviewIssues())
        
        let pullRequetsObseravle = api.fetchPullRequets(byRepositoryName: repository.fullName)
        pullRequetsViewModel = RepositoryPreviewListViewModel(apiCallObservable: pullRequetsObseravle,
                                                         previewListTitle: R.string.localizable.repositoryPreviewPullRequests())
        
        informationsTitle = R.string.localizable.repositoryPreviewInformations()
    }
    
}
