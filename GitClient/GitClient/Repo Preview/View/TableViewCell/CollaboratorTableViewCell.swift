//
//  CollaboratorTableViewCell.swift
//  GitClient
//
//  Created by Saad El Oulladi on 28/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import UIKit

class CollaboratorTableViewCell: UITableViewCell, RepositoryPreviewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setViewModel(model: Codable) {
        guard let collaborator = model as? User else { return}
        
        textLabel?.text = collaborator.login
    }
}
