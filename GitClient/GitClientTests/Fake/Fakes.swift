//
//  FakeApi.swift
//  GitClientTests
//
//  Created by Saad El Oulladi on 29/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import XCTest
import RxSwift
@testable import GitClient

class FakeCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    required init(navigationController: UINavigationController) {
    }
    
    func start() {
    }
    
}

class FakeApi<Model>: ApiInterface where Model: Codable {

    private var observableToReturn: Observable<Model>

    init(observableToReturn: Observable<Model>) {
        self.observableToReturn = observableToReturn
    }
    
    func searchRepository(withQuery query: String) -> Observable<[Repository]> {
        return observableToReturn as? Observable<[Repository]> ?? Observable.empty()
    }
    
    func fetchContributors(byRepositoryName repositoryName: String) -> Observable<[User]> {
        return observableToReturn as? Observable<[User]> ?? Observable.empty()
    }
    
    func fetchIssues(byRepositoryName repositoryName: String) -> Observable<[Issue]> {
        return observableToReturn as? Observable<[Issue]> ?? Observable.empty()
    }
    
    func fetchPullRequets(byRepositoryName repositoryName: String) -> Observable<[Issue]> {
        return observableToReturn as? Observable<[Issue]> ?? Observable.empty()
    }
    
    func fetchRemoteImage(withUrl urlString: String?) -> Observable<UIImage> {
        return Observable.empty()
    }
    
}


enum FakeData {
    
    static let coordinator = FakeCoordinator(navigationController: UINavigationController())
    
    static let repository: Repository = Repository(name: "Swinject",
                                                   fullName: "Swinject/Swinject",
                                                   description: "Dependency injection framework for Swift with iOS/macOS/Linux",
                                                   starsCount: 3188,
                                                   forksCount: 322,
                                                   openIssues: 12,
                                                   isFork: false,
                                                   owner: User(login: "Swinject",
                                                               avatarUrlString: "https://avatars3.githubusercontent.com/u/13637225?v=4",
                                                               contributionsCount: nil))
    
    static let issues: [Issue] = [Issue(title: "Memory leak in linux project (2.4.0)", commentsCount: 2, identifier: 1224),
                                  Issue(title: "public protocol Resolver should be class type", commentsCount: 1, identifier: 1344),
                                  Issue(title: "Circular dependency - unowned type", commentsCount: 0, identifier: 0976)]
    
    static let contributors: [User] = [User(login: "yoichitgy",
                                            avatarUrlString: "https://avatars2.githubusercontent.com/u/965994?s=400&v=4",
                                            contributionsCount:123),
                                       User(login: "toto",
                                            avatarUrlString: "https://avatars3.githubusercontent.com/u/2094466?s=400&v=4",
                                            contributionsCount:123)]

    static let api: ApiInterface = FakeApi<[Repository]>(observableToReturn: Observable.just([repository]))
    static let issuesApi: ApiInterface = FakeApi<[Issue]>(observableToReturn: Observable.just(issues))
    static let contributorsApi: ApiInterface = FakeApi<[User]>(observableToReturn: Observable.just(contributors))
}

