//
//  RepositoryTests.swift
//  GitClientTests
//
//  Created by Saad El Oulladi on 28/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import Quick
import Nimble

@testable import GitClient

class RepositoryTests: QuickSpec {
    
    enum FakeData {
        static let name = "Swinject"
        static let fullName = "Swinject/Swinject"
        static let description = "Dependency injection framework for Swift with iOS/macOS/Linux"
        static let stargazersCount = 3188
        static let isFork = false
        static let ownerLogin = "Swinject"
        static let ownerAvatarUrl = "https://avatars3.githubusercontent.com/u/13637225?v=4"
    }
    
    override func spec() {
        var testSubject: Repository!
        
        describe("Repository Model") {
            
            context("When parsed from json") {
                
                beforeEach {
                    let bundle = Bundle(for: type(of: self))
                    guard let url = bundle.url(forResource: "Repository", withExtension: "json") else {
                        fail("Json file doesn't exist")
                        return
                    }
                    do {
                        let json = try Data(contentsOf: url)
                        testSubject = try JSONDecoder().decode(Repository.self, from: json)
                    } catch {
                        fail("Wrong json format")
                    }
                }
                
                it("Should have the expected values") {
                    expect(testSubject.name).to(equal(FakeData.name))
                    expect(testSubject.fullName).to(equal(FakeData.fullName))
                    expect(testSubject.description).to(equal(FakeData.description))
                    expect(testSubject.isFork).to(equal(FakeData.isFork))
                    expect(testSubject.owner.login).to(equal(FakeData.ownerLogin))
                    expect(testSubject.owner.contributionsCount).to(beNil())
                    expect(testSubject.owner.avatarUrlString).to(equal(FakeData.ownerAvatarUrl))
                }
            }
            
        }
    }
}
