//
//  GitHubApi.swift
//  GitClient
//
//  Created by Saad El Oulladi on 26/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import RxSwift
import Alamofire
import AlamofireImage

protocol ApiInterface : class {
    
    /// Call GitHub Rest api to search for public repository.
    /// - parameter query: key for the repository we are searching for.
    func searchRepository(withQuery query:String) -> Observable<[Repository]>
    
    /// Call GitHub Rest api to get a repository contibutors.
    /// - parameter repositoryName: Represents the repository full name.
    func fetchContributors(byRepositoryName repositoryName:String) -> Observable<[User]>
    
    /// Call GitHub Rest api to get a repository Issues.
    /// - parameter repositoryName: Represents the repository full name.
    func fetchIssues(byRepositoryName repositoryName:String) -> Observable<[Issue]>
    
    /// Call GitHub Rest api to get a Pull Requests.
    /// - parameter repositoryName: Represents the repository full name.
    func fetchPullRequets(byRepositoryName repositoryName:String) -> Observable<[Issue]>

    /// Load Remote image by url string
    /// - parameter url : fetch .
    func fetchRemoteImage(withUrl urlString:String?) -> Observable<UIImage>
}

class BaseApi {
    @discardableResult
    fileprivate func apiRequest<Model>(withUrl requestUrlString:String) ->  Observable<Model> where Model:Codable {
        return Observable.create { observer -> Disposable in
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
                    let model = try JSONDecoder().decode(Model.self, from: responseData)
                    observer.onNext(model)
                    observer.onCompleted()
                } catch {
                    observer.onError(GitHubApiError.parsingError)
                }
            })
            return Disposables.create()
        }
    }
}

class GitHubApi: BaseApi, ApiInterface {

    @discardableResult
    func searchRepository(withQuery query:String) -> Observable<[Repository]> {
        let requestUrlString = Constant.search.path(withParameter: query)
        let apiRequestObservable:Observable<BaseResponse> = apiRequest(withUrl: requestUrlString)
        return apiRequestObservable.map { (baseResponse) -> [Repository] in
            guard let repositories = baseResponse.items else {
                throw GitHubApiError.wrongRequest
            }
            guard repositories.count > 0 else {
                throw GitHubApiError.notResults
            }
            return repositories
        }
    }
    
    @discardableResult
    func fetchContributors(byRepositoryName repositoryName:String) -> Observable<[User]> {
        let requestUrlString = Constant.contributors.path(withParameter: repositoryName)
        return apiRequest(withUrl: requestUrlString)
    }
    
    @discardableResult
    func fetchIssues(byRepositoryName repositoryName:String) -> Observable<[Issue]> {
        let requestUrlString = Constant.issues.path(withParameter: repositoryName)
        return apiRequest(withUrl: requestUrlString)
    }
    
    @discardableResult
    func fetchPullRequets(byRepositoryName repositoryName:String) -> Observable<[Issue]> {
        let requestUrlString = Constant.pullRequests.path(withParameter: repositoryName)
        return apiRequest(withUrl: requestUrlString)
    }
    
    @discardableResult
    func fetchRemoteImage(withUrl urlString:String?) -> Observable<UIImage> {
        guard let urlString = urlString else { return Observable.error(GitHubApiError.unknown) }
        return Observable.create { observer -> Disposable in
            Alamofire.request(urlString).responseImage { response in
                if let image = response.result.value {
                    observer.onNext(image)
                    observer.onCompleted()
                } else {
                    observer.onError(GitHubApiError.unknown)
                }
            }
            return Disposables.create()
        }
    }
}
