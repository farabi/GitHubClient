//
//  RepositoryTableViewCell.swift
//  GitClient
//
//  Created by Saad El Oulladi on 30/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import UIKit

protocol RepositoryPreviewCell where Self: UITableViewCell {
    func setViewModel(model:Codable)
}

class RepositoryTableViewCell: UITableViewCell, RepositoryPreviewCell {

    @IBOutlet private weak var fullNameLabel: UILabel!
    @IBOutlet private weak var starsLabel: UILabel!
    @IBOutlet private weak var forksLabel: UILabel!
    
    func setViewModel(model: Codable) {
        guard let repository = model as? Repository else { return}

        fullNameLabel.text = repository.fullName
        starsLabel.text = "\(repository.starsCount)"
        forksLabel.text = "\(repository.forksCount)"
    }
}
