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

class VWFakeApi: ApiInterface {
    
    func searchRepository(withQuery query: String) -> Observable<[Repository]> {
        <#code#>
    }
    
    func fetchContributors(byRepositoryName repositoryName: String) -> Observable<[User]> {
        <#code#>
    }
    
    func fetchIssues(byRepositoryName repositoryName: String) -> Observable<[Issue]> {
        <#code#>
    }
    
    func fetchPullRequets(byRepositoryName repositoryName: String) -> Observable<[Issue]> {
        <#code#>
    }
    
    func fetchRemoteImage(withUrl urlString: String?) -> Observable<UIImage> {
        <#code#>
    }
    
    
}
