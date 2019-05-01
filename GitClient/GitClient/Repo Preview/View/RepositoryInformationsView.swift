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
    
    fileprivate let disposeBag = DisposeBag()
    
    public weak var viewModel:RepositoryInformationsInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViews()
    }
    
    func bindViews() {
        guard let viewModel = viewModel else {
            print("ViewModel should be implemented for RepositoryInformationsView")
            return
        }
        
        viewModel.repositoryFullNameObservable
            .bind(to: titleLabel.rx.text).disposed(by:disposeBag)
        viewModel.repositoryOwnerObservable
            .bind(to: ownerLabel.rx.text).disposed(by:disposeBag)
        viewModel.repositoryDescriptionObservable
            .bind(to: descriptionLabel.rx.text).disposed(by:disposeBag)
        viewModel.repositoryStarsObservable
            .bind(to: starsLabel.rx.text).disposed(by:disposeBag)
        viewModel.repositoryForksObservable
            .bind(to: forksLabel.rx.text).disposed(by:disposeBag)
        viewModel.repositoryOwnerAvatar
            .bind(to: ownerImageView.rx.image).disposed(by:disposeBag)
    }

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: viewModel?.informationsTitle)
    }

}
