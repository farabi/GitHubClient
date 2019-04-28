//
//  RepositoryInformationsViewViewController.swift
//  GitClient
//
//  Created by Saad El Oulladi on 28/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import XLPagerTabStrip
import RxCocoa
import RxSwift

class RepositoryInformationsViewViewController: UIViewController, IndicatorInfoProvider {
    
    public weak var viewModel:RepositoryPreviewViewModellInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: viewModel?.informationsTitle)
    }

}
