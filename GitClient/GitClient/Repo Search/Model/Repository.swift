//
//  Repository.swift
//  GitClient
//
//  Created by Saad El Oulladi on 26/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import Foundation

// MARK: API Model
struct BaseResponse: Codable {
    let items: [Repository]?
}

// MARK: Model
struct Repository: Codable {
    
    let name: String
    let fullName: String
    let description: String
    let starsCount: Int
    let forksCount: Int
    let openIssues: Int
    let isFork: Bool
    let owner: User

    enum CodingKeys: String, CodingKey {
        case name
        case fullName = "full_name"
        case description
        case starsCount = "stargazers_count"
        case forksCount = "forks"
        case openIssues = "open_issues"
        case isFork = "fork"
        case owner
    }
}

struct User: Codable {
    
    let login: String
    let avatarUrlString: String?
    let contributionsCount: Int?
    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrlString = "avatar_url"
        case contributionsCount = "contributions"
    }
}
