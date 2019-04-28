//
//  UserTests.swift
//  GitClientTests
//
//  Created by Saad El Oulladi on 28/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import Quick
import Nimble

class UserTests: QuickSpec {


    func testJSONMapping() throws {
        let bundle = Bundle(for: type(of: self))
        
        guard let url = bundle.url(forResource: "User", withExtension: "json") else {
            XCTFail("Missing file: User.json")
            return
        }
        
        let json = try Data(contentsOf: url)
        let user: User = try unbox(data: json)
        
        XCTAssertEqual(user.name, "John")
        XCTAssertEqual(user.age, 29)
    }

}
