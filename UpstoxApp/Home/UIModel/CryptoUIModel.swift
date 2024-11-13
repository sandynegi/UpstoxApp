//
//  CryptoUIModel.swift
//  UpstoxApp
//
//  Created by Sandeep Negi on 11/11/24.
//

import Foundation
import UIKit

struct CryptoUIModel {
    let name: String
    let symbol: String
    let isNew: Bool
    let isActive: Bool
    let type: CryptoType
    
    var cyptoIcon: String? {
        if isActive {
            switch type {
            case .coin:
                return AppConstants.ImageName.cyptoCoinActive
            case .token:
                return AppConstants.ImageName.cyptoTokenActive
            default:
                return nil
            }
        } else {
            return AppConstants.ImageName.cyptoInActive
        }
    }
    
    var isActiveCoin: Bool {
        isActive && type == .coin
    }
    
    var isInActiveCoins: Bool {
        !isActive && type == .coin
    }
    
    var isOnlyTokens: Bool {
        type == .token
    }
    
    var isOnlyCoins: Bool {
        type == .coin
    }
    
    var isNewCoins: Bool {
        isNew && type == .coin
    }
    
    
    func getTintColor(currentStyle: UIUserInterfaceStyle = .light) -> UIColor? {
        if currentStyle == .dark {
            if !isActive || type == .token {
                return .white
            }
        }
        return nil
    }
    
    init(model: CryptoModel) {
        self.name = model.name ?? .empty
        self.symbol = model.symbol ?? .empty
        self.isNew = model.isNew ?? false
        self.isActive = model.isActive ?? false
        self.type = model.type ?? .none
    }
}
