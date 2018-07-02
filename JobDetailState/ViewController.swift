//
//  ViewController.swift
//  JobDetailState
//
//  Created by hieu nguyen on 7/2/18.
//  Copyright © 2018 hieu nguyen. All rights reserved.
//

import UIKit
let gray = UIColor(red: 231/255, green: 231/255, blue: 231/255, alpha: 1.0)
class ViewController: UIViewController {
	
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 160
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	var cornerLayerWidth:CGFloat = 0.0
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
			// TableViewCell()
//			tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
		cell.dosomething(indexPath: indexPath, tbv: tableView)
        return cell
    }
	
	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		let cornerRadius: CGFloat = 5
		cell.backgroundColor = .clear
		
		let layer = CAShapeLayer()
		let pathRef = CGMutablePath()
		let bounds = cell.bounds.insetBy(dx: 0, dy: 0)
		cornerLayerWidth = bounds.width
		var addLine = false
		
		layer.strokeColor = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1.0).cgColor
		
//		if indexPath.row == 0 && indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
//			pathRef.__addRoundedRect(transform: nil, rect: bounds, cornerWidth: cornerRadius, cornerHeight: cornerRadius)
//		}
//		else
		if indexPath.row == 0 {
			pathRef.move(to: .init(x: bounds.minX, y: bounds.maxY))
			pathRef.addArc(tangent1End: .init(x: bounds.minX, y: bounds.minY), tangent2End: .init(x: bounds.midX, y: bounds.minY), radius: cornerRadius)
			pathRef.addArc(tangent1End: .init(x: bounds.maxX, y: bounds.minY), tangent2End: .init(x: bounds.maxX, y: bounds.midY), radius: cornerRadius)
			pathRef.addLine(to: .init(x: bounds.maxX, y: bounds.maxY))
			
		}
		else
		if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
			pathRef.move(to: .init(x: bounds.minX, y: bounds.minY))
			pathRef.addArc(tangent1End: .init(x: bounds.minX, y: bounds.maxY), tangent2End: .init(x: bounds.midX, y: bounds.maxY), radius: cornerRadius)
			pathRef.addArc(tangent1End: .init(x: bounds.maxX, y: bounds.maxY), tangent2End: .init(x: bounds.maxX, y: bounds.midY), radius: cornerRadius)
			pathRef.addLine(to: .init(x: bounds.maxX, y: bounds.minY))
		} else {
//			pathRef.addRect(bounds)
//			addLine = true
		}
		
		layer.path = pathRef
		layer.fillColor = UIColor(white: 1, alpha: 1).cgColor
		
		if (addLine == true) {
			let lineLayer = CALayer()
			let lineHeight = 1.0 / UIScreen.main.scale
			lineLayer.frame = CGRect(x: bounds.minX, y: bounds.size.height - lineHeight, width: bounds.size.width , height: lineHeight)
			lineLayer.backgroundColor = tableView.separatorColor?.cgColor
			layer.addSublayer(lineLayer)
		}
		
		let testView = UIView(frame: bounds)
		testView.layer.insertSublayer(layer, at: 0)
		testView.backgroundColor = .clear
		cell.backgroundView = testView
	}
}


extension ViewController: UITableViewDelegate {
    
}


extension CALayer {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
        
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        mask = shape
    }
}

extension UIView {
    enum UIBorderSide {
        case Top, Bottom, Left, Right
    }
    
    func addLineBorder(side: UIBorderSide, color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        switch side {
        case .Top:
            border.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: width)
        case .Bottom:
            border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        case .Left:
            border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        case .Right:
            border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
        }
        
        layer.addSublayer(border)
        layer.masksToBounds = true
    }
}
