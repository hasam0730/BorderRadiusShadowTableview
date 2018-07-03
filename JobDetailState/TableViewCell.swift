//
//  TableViewCell.swift
//  JobDetailState
//
//  Created by hieu nguyen on 7/2/18.
//  Copyright © 2018 hieu nguyen. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

	@IBOutlet weak var lbl: UILabel!
	let bottomView = UIView()
    let cornerRadius: CGFloat = 8.0
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
		bottomView.backgroundColor = gray
    }

	func layoutBottomLie() {
		bottomView.frame = CGRect(x: bounds.minX-10, y: bounds.maxY-2.3, width: bounds.width+10, height: 2.3)
        bottomView.layer.cornerRadius = cornerRadius
        bottomView.layer.masksToBounds = true
        contentView.addSubview(bottomView)
	}
	
    override func draw(_ rect: CGRect) {
        contentView.addLineBorder(side: .Left, color: gray, width: 1)
		contentView.addLineBorder(side: .Right, color: gray, width: 1)
    }
	
	func dosomething(indexPath: IndexPath, tbv: UITableView) {
		if indexPath.row == tbv.numberOfRows(inSection: indexPath.section)-1 {
			layoutBottomLie()
			
			contentView.layer.cornerRadius = cornerRadius
			contentView.layer.masksToBounds = true
		} else if indexPath.row == 0 {
            contentView.layer.cornerRadius = cornerRadius
			contentView.layer.masksToBounds = true
		} else {
            contentView.layer.masksToBounds = false
		}
		contentView.addLineBorder(side: .Left, color: gray, width: 1)
		contentView.addLineBorder(side: .Right, color: gray, width: 1)
		contentView.backgroundColor = .white
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		
        bottomView.removeFromSuperview()
        bottomView.layer.masksToBounds = true
		
        contentView.addLineBorder(side: .Bottom, color: .white, width: 1)
	}
	
    override func layoutSubviews() {
		contentView.layer.masksToBounds = true
        bottomView.layer.masksToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension UIView {
	
	func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
		let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
		let mask = CAShapeLayer()
		mask.path = path.cgPath
		self.layer.mask = mask
	}
	
}
