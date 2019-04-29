//
//  GitHubApi+Error.swift
//  GitClient
//
//  Created by Saad El Oulladi on 26/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import Foundation

public enum GitHubApiError: Error {
    case wrongRequest
    case parsingError
    case notResults
    case unknown
}

extension GitHubApiError: LocalizedError {
    
    public var localizedDescription: String {
        switch self {
        case .wrongRequest:
            return R.string.localizable.apiErrorWrongRequest()
        case .parsingError:
            return R.string.localizable.apiErrorParsing()
        case .notResults:
            return R.string.localizable.apiErrorNoResults()
        case .unknown:
            return R.string.localizable.apiErrorUnknown()
        }
    }
    
}

