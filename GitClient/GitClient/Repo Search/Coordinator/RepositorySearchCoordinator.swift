//
//  RepoSearchCoordinator.swift
//  GitClient
//
//  Created by Saad El Oulladi on 26/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import UIKit
import RxSwift

protocol RepositorySearchCoordinatorInterface: class {
    
    //func navigateToRepoPreview()
}

class RepositorySearchCoordinator: Coordinator, RepositorySearchCoordinatorInterface {
    
    let disposeBag = DisposeBag()
    
    var childCoordinators: [Coordinator] = []
    
    unowned let navigationController:UINavigationController

    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
        /// Create View Model
        let searchRepositoryViewModel = SearchRepositoryViewModel(api: GitHubApi(), coordinator: self)
        
        searchRepositoryViewModel.selectRepositoryObservable.subscribe(onNext: { [unowned self] repository in
            /// Create Child Coordinator
            let repositoryPreviewCoordinator = RepositoryPreviewCoordinator(navigationController: self.navigationController)
            self.childCoordinators.append(repositoryPreviewCoordinator)
            repositoryPreviewCoordinator.start(withRepository: repository)
        }).disposed(by: disposeBag)
    
        // Create View
        let searchRepositoryView = SearchRepositoryView()
        searchRepositoryView.viewModel = searchRepositoryViewModel
        
        // Display view
        self.navigationController.viewControllers = [searchRepositoryView]
    }
}


