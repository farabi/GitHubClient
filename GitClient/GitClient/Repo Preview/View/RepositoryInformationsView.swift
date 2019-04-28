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

class RepositoryInformationsView: UIViewController, IndicatorInfoProvider {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var ownerLabel: UILabel!
    @IBOutlet private weak var ownerImageView: UIImageView!
    @IBOutlet private weak var starsLabel: UILabel!
    @IBOutlet private weak var forksLabel: UILabel!
    @IBOutlet private weak var pushesLabel: UILabel!
    
    public weak var viewModel:RepositoryInformationsInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bindViews()
    }
    
    func bindViews() {
        guard let viewModel = viewModel else {
            print("ViewModel should be implemented for ")
            return
        }
        
        
    }

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: viewModel?.informationsTitle)
    }

}
