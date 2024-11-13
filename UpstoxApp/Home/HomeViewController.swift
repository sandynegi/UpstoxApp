//
//  HomeViewController.swift
//  UpstoxApp
//
//  Created by Sandeep Negi on 11/11/24.
//

import Foundation
import UIKit

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView?
    @IBOutlet weak var progressIndicator: UIActivityIndicatorView?
    
    private var bottomConstraint: NSLayoutConstraint?
    
    var searchFilterView: CryptoSearchFilterView?
    
    var cyptoListViewModel: CyptoListViewModel?
    
    var allCyptoList: [CryptoUIModel]?
    
    var cyptoList: [CryptoUIModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addNavigationBarFilterAction()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = "COIN"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if cyptoListViewModel == nil {
            cyptoListViewModel = CyptoListViewModel(apiManager: APIManager())
            
        }
        progressIndicator?.startAnimating()
        cyptoListViewModel?.fetch(completion: { cyptoList in
            self.allCyptoList = cyptoList
            DispatchQueue.main.async { [weak self] in
                self?.updateUI()
                self?.progressIndicator?.stopAnimating()
            }
        })
    }
    
    private func setupUI() {
        tableView?.register(UINib(nibName: AppConstants.TableViewCellIdentifier.cryptoInfo, bundle: nil),
                            forCellReuseIdentifier: AppConstants.TableViewCellIdentifier.cryptoInfo)
        tableView?.accessibilityIdentifier = AppConstants.Accessibility.tvCryptoTable
        
        loadFilterView()
    }
    
    private func updateUI() {
        
        self.cyptoList = self.allCyptoList
        
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        
        self.tableView?.reloadData()
    }
    
    private func loadFilterView() {
        if searchFilterView == nil {
            searchFilterView = CryptoSearchFilterView.createView()
            searchFilterView?.isHidden = true
            searchFilterView?.frame = CGRect(x: .zero, y: view.frame.height + AppConstants.searchFilterHeight, width: .zero, height: .zero)
            searchFilterView?.setupUI()
            searchFilterView?.delegate = self
            
            if let searchFilterView {
                self.view.addSubview(searchFilterView)
                
                searchFilterView.translatesAutoresizingMaskIntoConstraints = false
                searchFilterView.heightAnchor.constraint(equalToConstant: AppConstants.searchFilterHeight).isActive = true
                searchFilterView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
                searchFilterView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
                bottomConstraint = searchFilterView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: AppConstants.searchFilterHeight)
                bottomConstraint?.isActive = true
            }
        }
    }
    
    
    @objc
    override func filterActionPressed(sender: UIButton) {
        var isShowingAnimation = true
        
        if searchFilterView?.isHidden ?? false {
            searchFilterView?.isHidden = false
            bottomConstraint?.constant = .zero
        } else {
            isShowingAnimation = false
            bottomConstraint?.constant = AppConstants.searchFilterHeight
        }
        
        UIView.animate(withDuration: 0.3, delay: .zero, options: .curveEaseInOut) { [weak self] in
            self?.view.layoutIfNeeded()
        } completion: { [weak self] completed in
            if completed {
                var tableViewInsets = self?.tableView?.contentInset
                if isShowingAnimation {
                    tableViewInsets?.bottom = AppConstants.searchFilterHeight
                } else {
                    self?.searchFilterView?.isHidden = true
                    tableViewInsets?.bottom = .zero
                }
                self?.tableView?.contentInset = tableViewInsets ?? .zero
            }
        }
    }
}

