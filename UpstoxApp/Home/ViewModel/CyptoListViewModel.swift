//
//  CyptoListViewModel.swift
//  UpstoxApp
//
//  Created by Sandeep Negi on 11/11/24.
//

import Foundation

class CyptoListViewModel {
    
    var apiManager: IAPIManager?
    
    init(apiManager: IAPIManager) {
        self.apiManager = apiManager
    }
    
    func fetch(completion:@escaping ([CryptoUIModel]?) -> ()) {
        self.apiManager?.fetchCyptoList { itemList in
            var cryptoUIList = [CryptoUIModel]()
            itemList?.forEach({ item in
                if !(item.name?.isEmpty ?? true) {
                    let uiModel = CryptoUIModel(model: item)
                    cryptoUIList.append(uiModel)
                }
            })
            completion(cryptoUIList)
        }
    }
}
