//
//  RepositoryPreviewListViewModel.swift
//  GitClient
//
//  Created by Saad El Oulladi on 28/04/2019.
//  Copyright © 2019 Saad El Oulladi. All rights reserved.
//

import RxCocoa
import RxSwift

class RepositoryPreviewListViewModel<Model> where Model: Codable {
    
    let listDataDriver:Driver<[Model]>
    let previewListTitle: String
    
    init(apiCallObservable: Observable<[Model]>,previewListTitle: String) {
        self.previewListTitle = previewListTitle
        listDataDriver = apiCallObservable.asDriver(onErrorJustReturn: [])
    }
}

