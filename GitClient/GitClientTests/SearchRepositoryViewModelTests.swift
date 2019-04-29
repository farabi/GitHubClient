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
        
        var testSubject: SearchRepositoryViewModelInterface!
        
        describe("SearchRepositoryViewModel") {
            
            context("When parsed from json") {
                
                beforeEach {
                    let bundle = Bundle(for: type(of: self))
                    guard let url = bundle.url(forResource: "BaseResponse", withExtension: "json") else {
                        fail("Json file doesn't exist")
                        return
                    }
                    do {
                        let json = try Data(contentsOf: url)
                        let apiResponse = try JSONDecoder().decode(BaseResponse.self, from: json)
                        //testSubject = SearchRepositoryViewModel(api: <#T##ApiInterface#>, coordinator: <#T##RepositorySearchCoordinatorInterface#>)
                    } catch {
                        fail("Wrong json format")
                    }
                }
                
                it("Should have the expected values") {
                }
            }
            
        }
    }
}
