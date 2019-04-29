//
//  UIViewController+Additions.swift
//  GitClient
//
//  Created by Saad El Oulladi on 29/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import UIKit

extension UIViewController {
    func alert(withMessage message: String) {
        let alertController = UIAlertController(title: R.string.localizable.apiErrorTitle(), message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: R.string.localizable.apiErrorOk(), style: .default, handler: nil))
        self.present(alertController, animated: true)
    }
}

