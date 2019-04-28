//
//  GitHubApi.swift
//  GitClient
//
//  Created by Saad El Oulladi on 26/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import RxSwift
import Alamofire

protocol ApiInterface : class {
    /// Call GitHub Rest api to search for public repository.
    /// - parameter query: key for the repository we are searching for.
    func searchRepository(withQuery query:String) -> Observable<[Repository]>
    /// Call GitHub Rest api to get a repository contibutors.
    /// - parameter repositoryName: Represents the repository full name.
    func fetchContributors(byRepositoryName repositoryName:String) -> Observable<[User]>
}

class GitHubApi : ApiInterface {

    @discardableResult
    func searchRepository(withQuery query:String) -> Observable<[Repository]> {
        
        return Observable.create { observer -> Disposable in
            
            let requestUrlString = Constant.search.path(withParameter: query)
            Alamofire.request(requestUrlString).responseData(completionHandler: { response in
                
                if let error = response.error {
                    observer.onError(error)
                    return
                }
                
                guard let responseData = response.result.value else {
                    observer.onError(GitHubApiError.unknown)
                    return
                }
                
                do {// Check for parsing error
                    let baseResponse = try JSONDecoder().decode(BaseResponse.self, from: responseData)
                    guard let repositories = baseResponse.items else {
                        observer.onError(GitHubApiError.wrongRequest)
                        return
                    }
                    observer.onNext(repositories)
                    observer.onCompleted()
                } catch {
                    observer.onError(GitHubApiError.parsingError)
                }
            })
            
            return Disposables.create()
        }
    }
    
    @discardableResult
    func fetchContributors(byRepositoryName repositoryName:String) -> Observable<[User]> {
        
        return Observable.create { observer -> Disposable in
            
            let requestUrlString = Constant.contributors.path(withParameter: repositoryName)
            Alamofire.request(requestUrlString).responseData(completionHandler: { response in
                
                if let error = response.error {
                    observer.onError(error)
                    return
                }
                
                guard let responseData = response.result.value else {
                    observer.onError(GitHubApiError.unknown)
                    return
                }
                
                do {
                    let collaborators = try JSONDecoder().decode([User].self, from: responseData)
                    observer.onNext(collaborators)
                    observer.onCompleted()
                } catch {
                    observer.onError(GitHubApiError.parsingError)
                }
            })
            
            return Disposables.create()
        }
    }
}
