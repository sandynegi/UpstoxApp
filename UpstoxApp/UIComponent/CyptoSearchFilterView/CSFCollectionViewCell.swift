//
//  CSFCollectionViewCell.swift
//  UpstoxApp
//
//  Created by Sandeep Negi on 11/11/24.
//

import UIKit

class CSFCollectionViewCell: BaseCollectionViewCell {
    
    @IBOutlet weak var btnTitle: UIButton?
    @IBOutlet weak var hStackView: UIStackView?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .searchFilterContent
        
        btnTitle?.isUserInteractionEnabled = false
    }

    
    func setup(title: String, isSelected: Bool) {
        btnTitle?.setTitle(title, for: .normal)
        btnTitle?.setTitleColor(.title, for: .normal)
        
        if isSelected {
            self.backgroundColor = .selectedSearchFilterContent
        } else {
            self.backgroundColor = .searchFilterContent
        }
        
    }
    
    override func layoutSubviews() {
        self.layer.cornerRadius = (self.frame.height) / .two
    }
}
