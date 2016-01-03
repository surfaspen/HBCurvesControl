
//
//  HBCurvesControl.swift
//  HBCurvesControl
//
//  Created by Hunter Bryant on 1/2/16.
//  Copyright © 2016 Hunter Bryant. All rights reserved.
//

import UIKit

class HBCurvesControl: UIView {
	
	//MARK: Properties
	
	let primaryColor: UIColor = UIColor(red: 101/255, green: 241/255, blue: 224/255, alpha: 1.0)
	let secondaryColor: UIColor = UIColor(red: 172/255, green: 177/255, blue: 191/255, alpha: 1.0)
	let bgColor: UIColor = UIColor(red: 53/255, green: 61/255, blue: 81/255, alpha: 1.0)
	let lineThickness: CGFloat = 2
	let curvesMargin = CGFloat(30)
	
	var controlPoints: [CGPoint]?
	var curve: HBCurvesControlCurve?
	
	var sliderArray: [UISlider]? = []
	
	//MARK: Initialization
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		initialize()
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		initialize()
	}
	
	func initialize() {
		self.curve = HBCurvesControlCurve(delegate: self)
		self.controlPoints = [CGPoint(x: 0, y: 0), CGPoint(x: 0.25, y: 0.25), CGPoint(x: 0.5, y: 0.5), CGPoint(x: 0.75, y: 0.75), CGPoint(x: 1, y: 1)]
	}
	
	//MARK: Functions

	func setup() {
		
		//TODO: Fix Slider Width Problem
		// Remove all subviews
		let views = self.subviews
		for view in views {
			view.removeFromSuperview()
		}
		
		for index in 0...4 {
			
			let newSlider = UISlider(frame: CGRectZero)
			newSlider.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI_2))
			newSlider.value = (1.0 / 4) * Float(index)
			newSlider.addTarget(self, action: "sliderChanged:", forControlEvents: .ValueChanged)
			newSlider.continuous = false
			
			let width = self.bounds.width - curvesMargin*2
			let xPos = ((width*CGFloat(index))/4)+curvesMargin
			let height = self.bounds.height - curvesMargin*2
			
			newSlider.frame = CGRect(x: xPos, y: 30, width: 30, height: height)
			
			sliderArray!.insert(newSlider, atIndex: index)
			self.addSubview(newSlider)
		}

	}
	
	override func drawRect(rect: CGRect) {
		let context: CGContextRef = UIGraphicsGetCurrentContext()!
		let colorSpace: CGColorSpaceRef = CGColorSpaceCreateDeviceRGB()!
		
		curve!.drawCurve(rect, inContext: context, withColorSpace: colorSpace)
		
	}
	
	func sliderChanged(sender: UISlider) {
		
	}
}








