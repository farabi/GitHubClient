//
//  SearchRepositoryViewModelTests.swift
//  GitClientTests
//
//  Created by Saad El Oulladi on 29/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import RxSwift
import RxCocoa
import RxNimble
import Quick
import Nimble

@testable import GitClient

class SearchRepositoryViewModelTests: QuickSpec {

    override func spec() {
        
        let testSubject = SearchRepositoryViewModel(api: FakeData.api,
                                                    coordinator: FakeData.coordinator)
        
        describe("Given a SearchRepositoryViewModel") {
            
            context("When searching for an existing repository") {
                
                beforeEach {
                    testSubject.searchObserver.onNext(FakeData.repository.name)
                }
                
                it("Then it should return the expected repositories") {
                        let result:[Repository] = try! testSubject.resultDriver.asObservable().toBlocking().first()!
                        expect(result.count).to(equal([FakeData.repository].count))
                        testSubject.searchObserver.onNext("Query")
                }
            }
            
        }
    }
}
