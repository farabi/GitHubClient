//
//  BaseModelTests.swift
//  GitClientTests
//
//  Created by Saad El Oulladi on 29/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import Quick
import Nimble

@testable import GitClient

class BaseModelTests: QuickSpec {
    
    enum FakeData {
        static let repositoriesCount = 2
    }
    
    override func spec() {
        var testSubject: BaseResponse!
        
        describe("BaseModel Model") {
            
            context("When parsed from json") {
                
                beforeEach {
                    let bundle = Bundle(for: type(of: self))
                    guard let url = bundle.url(forResource: "BaseResponse", withExtension: "json") else {
                        fail("Json file doesn't exist")
                        return
                    }
                    do {
                        let json = try Data(contentsOf: url)
                        testSubject = try JSONDecoder().decode(BaseResponse.self, from: json)
                    } catch {
                        fail("Wrong json format")
                    }
                }
                
                it("Should have the expected number of repositories") {
                    expect(testSubject.items?.count).to(equal(FakeData.repositoriesCount))
                }
            }
            
        }
    }
}

