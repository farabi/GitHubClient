//
//  UserTests.swift
//  GitClientTests
//
//  Created by Saad El Oulladi on 28/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import Quick
import Nimble

@testable import GitClient

class UserTests: QuickSpec {
    
    enum FakeData {
        static let login = "kzaher"
        static let contributions = 1686
        static let avatarUrl = "https://avatars1.githubusercontent.com/u/1641148?v=4"
    }
    
    override func spec() {
        var testSubject: User!
        
        describe("Given a User Model") {
            
            context("When parsed from json") {
                
                beforeEach {
                    let bundle = Bundle(for: type(of: self))
                    guard let url = bundle.url(forResource: "User", withExtension: "json") else {
                        fail("Json file doesn't exist")
                        return
                    }
                    do {
                        let json = try Data(contentsOf: url)
                        testSubject = try JSONDecoder().decode(User.self, from: json)
                    } catch {
                        fail("Wrong json format")
                    }
                }
                
                it("Then should have the expected values") {
                    expect(testSubject.login).to(equal(FakeData.login))
                    expect(testSubject.contributionsCount).to(equal(FakeData.contributions))
                    expect(testSubject.avatarUrlString).to(equal(FakeData.avatarUrl))
                }
            }
            
        }
    }
}
