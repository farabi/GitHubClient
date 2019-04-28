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

        // change selected bar color
//        settings.style.buttonBarBackgroundColor = .white
//        settings.style.buttonBarItemBackgroundColor = .white
//        settings.style.selectedBarBackgroundColor = purpleInspireColor
//        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
//        settings.style.selectedBarHeight = 2.0
//        settings.style.buttonBarMinimumLineSpacing = 0
//        settings.style.buttonBarItemTitleColor = .black
//        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
//        settings.style.buttonBarLeftContentInset = 0
//        settings.style.buttonBarRightContentInset = 0
//        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
//            guard changeCurrentIndex == true else { return }
//            oldCell?.label.textColor = .black
//            newCell?.label.textColor = self?.purpleInspireColor
//        }
        
    }

    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child_1 = RepositoryPreviewTableView<User>()
        let child_2 = RepositoryPreviewTableView<User>()
        return [child_1, child_2]
    }
    
}
