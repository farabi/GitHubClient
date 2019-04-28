//
//  Issue.swift
//  GitClient
//
//  Created by Saad El Oulladi on 28/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import Foundation

struct Issue: Codable {
    
    let title: String
    let commentsCount: Int?
    let identifier: Int
    enum CodingKeys: String, CodingKey {
        case title
        case commentsCount = "comments"
        case identifier = "number"
    }
}
