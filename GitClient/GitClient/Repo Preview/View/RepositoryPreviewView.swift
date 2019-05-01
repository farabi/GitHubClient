//
//  RepositoryPreviewView.swift
//  GitClient
//
//  Created by Saad El Oulladi on 27/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import RxCocoa
import RxSwift
import XLPagerTabStrip

class RepositoryPreviewView: ButtonBarPagerTabStripViewController {

    var viewModel:RepositoryListsViewModellInterface?
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        buttonBarPagerCustomAppearance()
    }
    
    private func buttonBarPagerCustomAppearance() {
        settings.style.buttonBarItemBackgroundColor = R.color.gitHubDarkGray()
        settings.style.buttonBarItemTitleColor = R.color.gitHubTextGray()
        buttonBarView.selectedBar.backgroundColor = R.color.gitHubClientBlue()
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {

        guard let viewModel = viewModel else {
            fatalError("ViewModel should be implemented for RepositoryPreviewView")
        }
        
        if let navigationController = navigationController {
            viewModel.repositoryNameObservable.bind(to: navigationController.rx.title).disposed(by: disposeBag)
        }
        
        let informationsView = RepositoryInformationsView()
        informationsView.viewModel = viewModel as? RepositoryInformationsInterface
        
        let collaboratorsView = RepositoryPreviewTableView<User, CollaboratorTableViewCell>()
        collaboratorsView.viewModel = viewModel.collaboratorsViewModel
        
        let issuesView = RepositoryPreviewTableView<Issue, IssueTableViewCell>()
        issuesView.viewModel = viewModel.issuesViewModel

        let pullRequetsView = RepositoryPreviewTableView<Issue, IssueTableViewCell>()
        pullRequetsView.viewModel = viewModel.pullRequetsViewModel

        
        return [informationsView, collaboratorsView, issuesView, pullRequetsView]
    }
}
