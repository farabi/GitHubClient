//
//  IssueTests.swift
//  GitClientTests
//
//  Created by Saad El Oulladi on 29/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import Quick
import Nimble

@testable import GitClient

class IssueTests: QuickSpec {
    
    enum FakeData {
        static let title = "Memory leak in linux project (2.4.0)"
        static let commentsCount = 1
        static let identifier = 400
    }
    
    override func spec() {
        var testSubject: Issue!
        
        describe("Issue Model") {
            
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
