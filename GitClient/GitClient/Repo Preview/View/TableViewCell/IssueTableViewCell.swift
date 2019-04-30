//
//  IssueTableViewCell.swift
//  GitClient
//
//  Created by Saad El Oulladi on 28/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import UIKit

class IssueTableViewCell: UITableViewCell, RepositoryPreviewCell {

    @IBOutlet weak private var commentsCount: UILabel!
    @IBOutlet weak private var isseTitleLabel: UILabel!
    @IBOutlet weak private var issueNumberLabel: UILabel!

    func setViewModel(model: Codable) {
        
        guard let issue = model as? Issue else { return }

        isseTitleLabel?.text = issue.title
        issueNumberLabel?.text = "#\(issue.identifier)"
        if let comments = issue.commentsCount {
            commentsCount?.text = "\(comments)"
        } else {
        }
    }
    
}
