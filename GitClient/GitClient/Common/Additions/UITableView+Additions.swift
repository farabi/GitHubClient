//
//  UITableView+Additions.swift
//  GitClient
//
//  Created by Saad El Oulladi on 27/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import UIKit

extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableView {
    func registerCell(Type: UITableViewCell.Type) {
        self.register(Type.self,
                      forCellReuseIdentifier: Type.reuseIdentifier)
    }
    
    func registerCellNib(withType Type: UITableViewCell.Type) {
        self.register(UINib(nibName: String(describing: Type.self), bundle: nil),
                      forCellReuseIdentifier: Type.reuseIdentifier)
    }
}


