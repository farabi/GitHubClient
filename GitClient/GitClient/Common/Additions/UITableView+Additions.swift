//
//  UITableView+Additions.swift
//  GitClient
//
//  Created by Saad El Oulladi on 27/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import UIKit

protocol Reusable {}

extension UITableViewCell: Reusable {}

extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableView {
    func registerCell(_ Type: UITableViewCell.Type) {
        self.register(Type.self,
                      forCellReuseIdentifier: Type.reuseIdentifier)
    }
}


