//
//  SearchRepositoryViewModelTests.swift
//  GitClientTests
//
//  Created by Saad El Oulladi on 29/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//
import Quick
import Nimble

@testable import GitClient

class SearchRepositoryViewModelTests: QuickSpec {
    
    override func spec() {
        var testSubject: SearchRepositoryViewModel!
        
        describe("SearchRepositoryViewModel") {
            
            context("When parsed from json") {
                
                beforeEach {
                    let bundle = Bundle(for: type(of: self))
                    guard let url = bundle.url(forResource: "Issue", withExtension: "json") else {
                        fail("Json file doesn't exist")
                        return
                    }
                    do {
                        let json = try Data(contentsOf: url)
                        testSubject = try JSONDecoder().decode(Issue.self, from: json)
                    } catch {
                        fail("Wrong json format")
                    }
                }
                
                it("Should have the expected values") {
                    expect(testSubject.title).to(equal(FakeData.title))
                    expect(testSubject.commentsCount).to(equal(FakeData.commentsCount))
                    expect(testSubject.identifier).to(equal(FakeData.identifier))
                }
            }
            
        }
    }
}
