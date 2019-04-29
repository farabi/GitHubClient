//
//  RepositoryListsViewModellInterface.swift
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

class RepositoryListsViewModellInterfaceTests: QuickSpec {
    
    override func spec() {
        
        var testSubject: RepositoryListsViewModellInterface!
        
        describe("Given a RepositoryListsViewModellInterface") {
            
            context("When used for issues list") {
                
                beforeEach {
                    testSubject = RepositoryPreviewViewModel(repository: FakeData.repository,
                                                             api: FakeData.issuesApi,
                                                             coordinator: FakeData.coordinator)
                }

                it("Should have the right issues") {
                    
                    let result:[Issue] = try! testSubject.issuesViewModel.listDataDriver.toBlocking().first()!
                    
                    expect(result.count).to(equal(FakeData.issues.count))
                    
                    expect(result.first?.commentsCount).to(equal(FakeData.issues.first?.commentsCount))

                    expect(result.first?.title).to(equal(FakeData.issues.first?.title))
                }
            }
            
            context("When used for contributors list") {
                
                beforeEach {
                    testSubject = RepositoryPreviewViewModel(repository: FakeData.repository,
                                                             api: FakeData.contributorsApi,
                                                             coordinator: FakeData.coordinator)
                }
                
                it("Should have the right User") {
                    
                    let result:[User] = try! testSubject.collaboratorsViewModel.listDataDriver.toBlocking().first()!
                    
                    expect(result.count).to(equal(FakeData.contributors.count))
                    
                    expect(result.first?.login).to(equal(FakeData.contributors.first?.login))
                    
                    expect(result.first?.avatarUrlString).to(equal(FakeData.contributors.first?.avatarUrlString))
                    
                    
                }
            }
        }
    }
}
