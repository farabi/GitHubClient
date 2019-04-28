//
//  RepositoryPreviewCoordinator.swift
//  GitClient
//
//  Created by Saad El Oulladi on 27/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import UIKit

class RepositoryPreviewCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    unowned let navigationController:UINavigationController

    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    /// Default start method is not used.
    func start() {
        fatalError("start(withRepository:) should be used instead")
    }
    
    func start(withRepository repository: Repository) {
        
        // Create ViewModel
        let repositoryPreviewViewModel = RepositoryPreviewViewModel(repository: repository,api: GitHubApi(), coordinator: self)

        // Create View
        let repositoryPreviewView = RepositoryPreviewView()
        repositoryPreviewView.viewModel = repositoryPreviewViewModel
        navigationController.pushViewController(repositoryPreviewView, animated: true)
    }
}
