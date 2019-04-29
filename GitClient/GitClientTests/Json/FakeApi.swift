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

class FakeApi<Model>: ApiInterface where Model: Codable {
    
    var observableToReturn: Observable<Model>!
    
    func searchRepository(withQuery query: String) -> Observable<[Repository]> {
        return observableToReturn as! Observable<[Repository]>
    }
    
    func fetchContributors(byRepositoryName repositoryName: String) -> Observable<[User]> {
        return observableToReturn as! Observable<[User]>
    }
    
    func fetchIssues(byRepositoryName repositoryName: String) -> Observable<[Issue]> {
        return observableToReturn as! Observable<[Issue]>
    }
    
    func fetchPullRequets(byRepositoryName repositoryName: String) -> Observable<[Issue]> {
        return observableToReturn as! Observable<[Issue]>
    }
    
    func fetchRemoteImage(withUrl urlString: String?) -> Observable<UIImage> {
        return Observable.empty()
    }
    
}
