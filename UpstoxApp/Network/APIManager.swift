//
//  APIManager.swift
//  UpstoxApp
//
//  Created by Sandeep Negi on 11/11/24.
//

import Foundation

protocol IAPIManager {
    func fetchCyptoList(completion:@escaping ([CryptoModel]?) -> ())
}

class APIManager: IAPIManager {
    func fetchCyptoList(completion:@escaping ([CryptoModel]?) -> ()) {
        let url = URL(string: AppConstants.cyptoListEndPoint)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let urlSession = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data {
                guard let jsonObj = try? JSONDecoder().decode([CryptoModel].self, from: data) else {
                    completion(nil)
                    return
                }
                if !(jsonObj.isEmpty) {
                    completion(jsonObj)
                } else {
                    completion(nil)
                }
            } else {
                debugPrint("Unable to fetch Data, loading saved data")
                completion(getSavedCryptoList())
            }
        }

        urlSession.resume()
    }
}
