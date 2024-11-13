//
//  CryptoTableViewCell.swift
//  UpstoxApp
//
//  Created by Sandeep Negi on 11/11/24.
//

import UIKit

class CryptoTableViewCell: BaseTableViewCell {

    @IBOutlet weak var lblName: UILabel?
    @IBOutlet weak var lblSymbol: UILabel?
    @IBOutlet weak var imgCyptoIcon: UIImageView?
    @IBOutlet weak var imgNew: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(crypto: CryptoUIModel?) {
        lblName?.text = crypto?.name ?? .empty
        lblSymbol?.text = crypto?.symbol ?? .empty
        
        lblName?.textColor = .title
        lblSymbol?.textColor = .content
        
        if crypto?.isNew ?? false {
            imgNew?.isHidden = false
            imgNew?.image = UIImage(named: AppConstants.ImageName.isNewCyptoBanner)
        } else {
            imgNew?.isHidden = false
            imgNew?.image = nil
        }
        
        
        if let cyptoIcon = crypto?.cyptoIcon {
            imgCyptoIcon?.isHidden = false
            
            // Dark colour support of black icons
            if let tintColor = crypto?.getTintColor(currentStyle: self.traitCollection.userInterfaceStyle) {
                imgCyptoIcon?.image = UIImage(named: cyptoIcon)?.withRenderingMode(.alwaysTemplate)
                imgCyptoIcon?.tintColor = tintColor
            } else {
                imgCyptoIcon?.image = UIImage(named: cyptoIcon)
            }
            
        } else {
            imgCyptoIcon?.isHidden = false
            imgCyptoIcon?.image = nil
        }
    }
}
