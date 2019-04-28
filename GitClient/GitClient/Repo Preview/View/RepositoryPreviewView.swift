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

    public var viewModel:RepositoryPreviewViewModellInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonBarPagerCustomAppearance()
    }
    
    func buttonBarPagerCustomAppearance() {
        settings.style.buttonBarItemBackgroundColor = R.color.githubLightGray()
        settings.style.buttonBarItemTitleColor = R.color.gitHubTextGray()
        buttonBarView.selectedBar.backgroundColor = R.color.gitHubClientBlue()
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let collaboratorsView = RepositoryPreviewTableView<User>()
        collaboratorsView.viewModel = viewModel?.collaboratorsViewModel

        let child_2 = RepositoryPreviewTableView<User>()
        
        return [collaboratorsView, child_2]
    }
    
}
