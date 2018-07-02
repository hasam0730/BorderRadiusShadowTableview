//
//  TableViewCell.swift
//  JobDetailState
//
//  Created by hieu nguyen on 7/2/18.
//  Copyright © 2018 hieu nguyen. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func draw(_ rect: CGRect) {
        containerView.addLineBorder(side: .Left, color: .gray, width: 1.0)
        containerView.addLineBorder(side: .Right, color: .gray, width: 1.0)
    }
    
    override func layoutSubviews() {
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
