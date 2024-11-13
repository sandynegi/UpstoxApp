//
//  BaseViewController.swift
//  UpstoxApp
//
//  Created by Sandeep Negi on 11/11/24.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func addNavigationBarFilterAction() {
        let searchNavImage = UIImage(systemName: AppConstants.ImageName.searchNavIcon)?.withTintColor(.sfSymbol,
                                                                                                      renderingMode: .alwaysOriginal)
        let searchFilterButton = UIBarButtonItem(image: searchNavImage,
                        style: .plain,
                        target: self,
                        action: #selector(filterActionPressed))
        
        searchFilterButton.accessibilityIdentifier = AppConstants.Accessibility.searchFilterBarButton
        
        self.navigationItem.rightBarButtonItem = searchFilterButton
        
        self.navigationController?.navigationBar.accessibilityIdentifier = AppConstants.Accessibility.navigationBar
    }
    
    @objc 
    func filterActionPressed(sender: UIButton) {
        debugPrint(#function)
    }
}

