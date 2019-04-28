//
//  Coordinator.swift
//  GitClient
//
//  Created by Saad El Oulladi on 26/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import UIKit

public protocol Coordinator : class {
    
    var childCoordinators: [Coordinator] { get set }
    
    init(navigationController:UINavigationController)
    
    func start()
}
