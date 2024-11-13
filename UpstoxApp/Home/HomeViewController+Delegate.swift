//
//  HomeViewController+Delegate.swift
//  UpstoxApp
//
//  Created by Sandeep Negi on 13/11/24.
//

import UIKit

extension HomeViewController: CryptoSearchFilterViewDelegate {
    func allAppliedFilters(filters: [AppConstants.CyptoSearchFilterOption]) {
        
        let filteredCyptoList = allCyptoList?.compactMap({ item in
            var itemAllowed = false
            for filter in filters {
                
                switch filter {
                case .activeCoins:
                    itemAllowed = item.isActiveCoin
                case .inActiveCoins:
                    itemAllowed = item.isInActiveCoins
                case .onlyTokens:
                    itemAllowed = item.isOnlyTokens
                case .onlyCoins:
                    itemAllowed = item.isOnlyCoins
                case .newCoins:
                    itemAllowed = item.isNewCoins
                }
                
                if itemAllowed {
                    break
                }
            }
            if itemAllowed {
                return item
            } else {
                return nil
            }
        })
        
        cyptoList?.removeAll()
        
        if !(filteredCyptoList?.isEmpty ?? true) {
            cyptoList = filteredCyptoList
        } else {
            cyptoList = allCyptoList
        }
        
        tableView?.reloadData()
    }
}
