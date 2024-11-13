//
//  AppConstants.swift
//  UpstoxApp
//
//  Created by Sandeep Negi on 11/11/24.
//

import Foundation

enum AppConstants {
    static let cyptoListEndPoint = "https://37656be98b8f42ae8348e4da3ee3193f.api.mockbin.io/"
    static let searchFilterHeight = 150.0
    
    enum ImageName {
        // Images
        static let isNewCyptoBanner = "newBannerBanner"
        static let cyptoCoinActive = "cyptoCoinActive"
        static let cyptoInActive = "cyptoInActive"
        static let cyptoTokenActive = "cyptoTokenActive"
        
        //SF Symbol
        static let searchNavIcon = "magnifyingglass"
        static let checkmark = "checkmark"
    }
    
    enum CyptoSearchFilterOption: String, CaseIterable {
        case activeCoins = "Active Coins"
        case inActiveCoins = "Inactive Coins"
        case onlyTokens = "Only Tokens"
        case onlyCoins = "Only Coins"
        case newCoins = "New Coins"
    }
    
    enum Accessibility {
        static let tvCryptoTable = "table_view_cypto_list"
        static let searchFilterBarButton = "nav_bar_button_search_filter"
        static let navigationBar = "nav_bar_item"
        
        static let cryptoSearchFilterView = "crypto_search_filter_view"
        static let cryptoCollectionView = "crypto_collection_view"
        static let cryptoSearchFilterOption = "crypto_search_filter_option_"
    }
    
    enum TableViewCellIdentifier {
        static let cryptoInfo = "CryptoTableViewCell"
    }

    enum CollectionViewCellIdentifier {
        static let searchFilterCell = "CSFCollectionViewCell"
    }
    
    enum CustomViewIdentifier {
        static let searchFilter = "CryptoSearchFilterView"
    }
}





func getSavedCryptoList() -> [CryptoModel]? {
    let responseData = Data(response.utf8)
    let jsonObj = try? JSONDecoder().decode([CryptoModel].self, from: responseData)
    return jsonObj
}

let response = """
[
  {
    "name": "Bitcoin",
    "symbol": "BTC",
    "is_new": false,
    "is_active": true,
    "type": "coin"
  },
  {
    "name": "Ethereum",
    "symbol": "ETH",
    "is_new": false,
    "is_active": true,
    "type": "token"
  },
  {
    "name": "Ripple",
    "symbol": "XRP",
    "is_new": false,
    "is_active": false,
    "type": "coin"
  },
  {
    "name": "Cardano",
    "symbol": "ADA",
    "is_new": true,
    "is_active": true,
    "type": "coin"
  },
  {
    "name": "Litecoin",
    "symbol": "LTC",
    "is_new": false,
    "is_active": true,
    "type": "coin"
  },
  {
    "name": "Chainlink",
    "symbol": "LINK",
    "is_new": true,
    "is_active": true,
    "type": "token"
  },
  {
    "name": "Polkadot",
    "symbol": "DOT",
    "is_new": true,
    "is_active": true,
    "type": "coin"
  },
  {
    "name": "Bitcoin Cash",
    "symbol": "BCH",
    "is_new": false,
    "is_active": true,
    "type": "coin"
  },
  {
    "name": "Stellar",
    "symbol": "XLM",
    "is_new": false,
    "is_active": true,
    "type": "coin"
  },
  {
    "name": "Monero",
    "symbol": "XMR",
    "is_new": false,
    "is_active": true,
    "type": "coin"
  },
  {
    "name": "Tezos",
    "symbol": "XTZ",
    "is_new": true,
    "is_active": true,
    "type": "token"
  },
  {
    "name": "Binance Coin",
    "symbol": "BNB",
    "is_new": false,
    "is_active": true,
    "type": "coin"
  },
  {
    "name": "EOS",
    "symbol": "EOS",
    "is_new": false,
    "is_active": true,
    "type": "coin"
  },
  {
    "name": "TRON",
    "symbol": "TRX",
    "is_new": false,
    "is_active": true,
    "type": "coin"
  },
  {
    "name": "NEO",
    "symbol": "NEO",
    "is_new": false,
    "is_active": true,
    "type": "coin"
  },
  {
    "name": "Dash",
    "symbol": "DASH",
    "is_new": false,
    "is_active": true,
    "type": "coin"
  },
  {
    "name": "Zcash",
    "symbol": "ZEC",
    "is_new": false,
    "is_active": true,
    "type": "coin"
  },
  {
    "name": "VeChain",
    "symbol": "VET",
    "is_new": false,
    "is_active": true,
    "type": "coin"
  },
  {
    "name": "Tether",
    "symbol": "USDT",
    "is_new": false,
    "is_active": true,
    "type": "token"
  },
  {
    "name": "Cosmos",
    "symbol": "ATOM",
    "is_new": false,
    "is_active": true,
    "type": "coin"
  },
  {
    "name": "Solana",
    "symbol": "SOL",
    "is_new": true,
    "is_active": true,
    "type": "coin"
  },
  {
    "name": "Aave",
    "symbol": "AAVE",
    "is_new": true,
    "is_active": true,
    "type": "token"
  },
  {
    "name": "Uniswap",
    "symbol": "UNI",
    "is_new": false,
    "is_active": true,
    "type": "token"
  },
  {
    "name": "Maker",
    "symbol": "MKR",
    "is_new": false,
    "is_active": true,
    "type": "token"
  },
  {
    "name": "Compound",
    "symbol": "COMP",
    "is_new": true,
    "is_active": false,
    "type": "token"
  },
  {
    "name": "SushiSwap",
    "symbol": "SUSHI",
    "is_new": true,
    "is_active": false,
    "type": "token"
  }
]
"""

