//
//  HomeViewController+TableView.swift
//  UpstoxApp
//
//  Created by Sandeep Negi on 11/11/24.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return .one
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cyptoList?.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cyptoCell: CryptoTableViewCell? = tableView.dequeueReusableCell(withIdentifier: AppConstants.TableViewCellIdentifier.cryptoInfo,
                                                                            for: indexPath) as? CryptoTableViewCell
        cyptoCell?.setup(crypto: cyptoList?[indexPath.row])
        
        return cyptoCell ?? UITableViewCell(frame: .zero)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        debugPrint(#function)
    }
}
