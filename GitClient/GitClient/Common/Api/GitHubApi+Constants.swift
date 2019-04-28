//
//  GitHubApi+Constants.swift
//  GitClient
//
//  Created by Saad El Oulladi on 26/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import Foundation

extension GitHubApi {
    
    enum Constant :String {
        
        private static let baseUrl = "https://api.github.com"
        
        case search = "/search/repositories?q=%@&sort=stars&order=desc"
        case branches = "/repos/%@/branches"
        case contributors = "/repos/%@/contributors"
        case issues = "/repos/%@/issues"
        case pullRequests = "/repos/%@/pulls"
        
        func path(withParameter parameter:String) -> String {
            return String(format: Constant.baseUrl+rawValue, parameter)
        }
    }
}
