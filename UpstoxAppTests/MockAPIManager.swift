//
//  MockAPIManager.swift
//  UpstoxAppTests
//
//  Created by Sandeep Negi on 12/11/24.
//

import Foundation
@testable import UpstoxApp

class MockAPIManager: IAPIManager {
    
    let response: String
    
    init(response: String) {
        self.response = response
    }
    
    func fetchCyptoList(completion:@escaping ([CryptoModel]?) -> ()) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            let responseData = Data(self.response.utf8)
            let jsonObj = try? JSONDecoder().decode([CryptoModel].self, from: responseData)
            completion(jsonObj)
        }
    }
}
