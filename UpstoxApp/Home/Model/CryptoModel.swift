//
//  CryptoModel.swift
//  UpstoxApp
//
//  Created by Sandeep Negi on 11/11/24.
//

import Foundation

// MARK: - CryptoModel
struct CryptoModel: Codable {
    let name, symbol: String?
    let isNew, isActive: Bool?
    let type: CryptoType?

    enum CodingKeys: String, CodingKey {
        case name, symbol
        case isNew = "is_new"
        case isActive = "is_active"
        case type
    }
}

enum CryptoType: String, Codable {
    case none = ""
    case coin = "coin"
    case token = "token"
}

