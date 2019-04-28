//
//  User.swift
//  GitClient
//
//  Created by Saad El Oulladi on 28/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import Foundation

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
