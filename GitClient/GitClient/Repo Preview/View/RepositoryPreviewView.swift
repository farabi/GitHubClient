//
//  RepositoryPreviewView.swift
//  GitClient
//
//  Created by Saad El Oulladi on 27/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class RepositoryPreviewView: ButtonBarPagerTabStripViewController {

    public var viewModel:RepositoryListsViewModellInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonBarPagerCustomAppearance()
    }
    
    func buttonBarPagerCustomAppearance() {
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.buttonBarItemTitleColor = R.color.gitHubTextGray()
        buttonBarView.selectedBar.backgroundColor = R.color.gitHubClientBlue()
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {

        let informationsView = RepositoryInformationsView()
        informationsView.viewModel = viewModel as? RepositoryInformationsInterface
        
        let collaboratorsView = RepositoryPreviewTableView<User, CollaboratorTableViewCell>()
        collaboratorsView.viewModel = viewModel?.collaboratorsViewModel
        
        let issuesView = RepositoryPreviewTableView<Issue, IssueTableViewCell>()
        issuesView.viewModel = viewModel?.issuesViewModel

        let pullRequetsView = RepositoryPreviewTableView<Issue, IssueTableViewCell>()
        pullRequetsView.viewModel = viewModel?.pullRequetsViewModel

        
        return [informationsView, collaboratorsView, issuesView, pullRequetsView]
    }
}
