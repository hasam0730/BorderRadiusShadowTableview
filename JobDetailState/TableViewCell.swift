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
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
		bottomView.backgroundColor = gray
		
		layoutBottomLie()
		
    }

	func layoutBottomLie() {
		bottomView.frame = CGRect(x: bounds.minX, y: bounds.maxY-2, width: bounds.width, height: 2)
		bottomView.layer.cornerRadius = 0.2
		bottomView.layer.masksToBounds = true
	}
	
    override func draw(_ rect: CGRect) {
		print(rect)
//		contentView.addLineBorder(side: .Left, color: gray, width: 1.2)
		contentView.addLineBorder(side: .Right, color: gray, width: 1.2)
		layoutBottomLie()
    }
	
	func dosomething(indexPath: IndexPath, tbv: UITableView) {
		if indexPath.row == tbv.numberOfRows(inSection: indexPath.section)-1 {
			lbl.text = "qiuweiqueiqwueiu"
			layoutBottomLie()
			
			contentView.addSubview(bottomView)
			layoutBottomLie()
			contentView.layer.cornerRadius = 10.0
			contentView.layer.masksToBounds = true
		} else if indexPath.row == 0 {
			contentView.layer.cornerRadius = 10.0
			contentView.layer.masksToBounds = true
		} else {
			contentView.addLineBorder(side: .Bottom, color: .white, width: 1.2)
		}
		contentView.addLineBorder(side: .Left, color: gray, width: 1.2)
		contentView.addLineBorder(side: .Right, color: gray, width: 1.2)
		contentView.backgroundColor = .white
		layoutBottomLie()
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		
		layoutBottomLie()
		contentView.layer.masksToBounds = false
		
		contentView.addLineBorder(side: .Bottom, color: .white, width: 1.2)
	}
	
    override func layoutSubviews() {
		
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
