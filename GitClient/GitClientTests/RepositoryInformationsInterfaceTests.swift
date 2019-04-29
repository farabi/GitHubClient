//
//  RepositoryPreviewViewModelTest.swift
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

class RepositoryInformationsInterfaceTests: QuickSpec {
    
    override func spec() {
        
        let testSubject: RepositoryInformationsInterface = RepositoryPreviewViewModel(repository: FakeData.repository,
                                                                                 api: FakeData.api,
                                                                                 coordinator: FakeData.coordinator)
        describe("Given a RepositoryPreviewViewModel") {
            
            context("When initialised") {
                
                it("Should have the right full name") {
                    expect(testSubject.repositoryFullNameObservable).first == FakeData.repository.fullName
                }
                
                it("Should have the right description") {
                    expect(testSubject.repositoryDescriptionObservable).first == FakeData.repository.description
                }
                
                it("Should have the right Stars") {
                    expect(testSubject.repositoryStarsObservable).first == "\(FakeData.repository.starsCount)"
                }
                
                it("Should have the right owner") {
                    expect(testSubject.repositoryOwnerObservable).first == FakeData.repository.owner.login
                }
            }
        }
    }
}
