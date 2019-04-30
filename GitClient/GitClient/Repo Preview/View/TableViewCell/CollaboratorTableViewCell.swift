//
//  CollaboratorTableViewCell.swift
//  GitClient
//
//  Created by Saad El Oulladi on 28/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import UIKit
import RxSwift

class CollaboratorTableViewCell: UITableViewCell, RepositoryPreviewCell {

    @IBOutlet private weak var commitsLabel: UILabel!
    @IBOutlet private weak var loginLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
 
    let disposeBag = DisposeBag()
    
    func setViewModel(model: Codable) {
        guard let collaborator = model as? User else { return}
        
        GitHubApi().fetchRemoteImage(withUrl: collaborator.avatarUrlString)
            .bind(to: avatarImageView.rx.image).disposed(by: disposeBag)
        loginLabel?.text = collaborator.login
        if let contributionsCount = collaborator.contributionsCount {
            commitsLabel?.text = "\(contributionsCount)" + R.string.localizable.repositoryPreviewContributions()
        }
    }
}
