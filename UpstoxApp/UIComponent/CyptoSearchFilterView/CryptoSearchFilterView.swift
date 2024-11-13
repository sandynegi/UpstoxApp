//
//  CryptoSearchFilterView.swift
//  UpstoxApp
//
//  Created by Sandeep Negi on 11/11/24.
//

import UIKit

protocol CryptoSearchFilterViewDelegate: NSObject {
    func allAppliedFilters(filters: [AppConstants.CyptoSearchFilterOption])
}

class CryptoSearchFilterView: BaseView {
    
    @IBOutlet weak var collectionView: UICollectionView?
    
    weak var delegate: CryptoSearchFilterViewDelegate?
    
    fileprivate let allFilters = AppConstants.CyptoSearchFilterOption.allCases
    
    fileprivate var selectedFilters: [AppConstants.CyptoSearchFilterOption] = []
    
    static func createView() -> CryptoSearchFilterView? {
        return Bundle.main.loadNibNamed(AppConstants.CustomViewIdentifier.searchFilter, owner: self, options: nil)?.first as? CryptoSearchFilterView
    }
    
    func setupUI() {
        self.accessibilityIdentifier = AppConstants.Accessibility.cryptoSearchFilterView
        collectionView?.accessibilityIdentifier = AppConstants.Accessibility.cryptoCollectionView
        
        collectionView?.register(UINib(nibName: AppConstants.CollectionViewCellIdentifier.searchFilterCell, bundle: nil),
                                 forCellWithReuseIdentifier: AppConstants.CollectionViewCellIdentifier.searchFilterCell)
        
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        collectionView?.reloadData()
        
        self.backgroundColor = .searchFilterBG
    }
}

extension CryptoSearchFilterView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allFilters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let filterCell = collectionView.dequeueReusableCell(withReuseIdentifier: AppConstants.CollectionViewCellIdentifier.searchFilterCell,
                                                            for: indexPath) as? CSFCollectionViewCell
        
        let item = allFilters[indexPath.row]
        let isSelectedItem = selectedFilters.contains(item)
        
        filterCell?.setup(title: item.rawValue, isSelected: isSelectedItem)
        
        filterCell?.accessibilityIdentifier = AppConstants.Accessibility.cryptoSearchFilterOption + "\(indexPath.row)"
        
        return filterCell ?? UICollectionViewCell(frame: .zero)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem = allFilters[indexPath.row]
        if selectedFilters.contains(selectedItem) {
            selectedFilters.removeAll { $0 == selectedItem }
        } else {
            selectedFilters.append(selectedItem)
        }
        
        collectionView.reloadData()
        
        delegate?.allAppliedFilters(filters: selectedFilters)
    }
}
