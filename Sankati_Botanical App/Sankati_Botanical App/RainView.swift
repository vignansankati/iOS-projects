//
//  RainView.swift
//  Sankati_Botanical App
//
//  Created by Sankati,Vignan on 4/2/16.
//  Copyright © 2016 Sankati,Vignan. All rights reserved.
//  compiled in iPhone6s

import UIKit

class RainView: UIView {

    var rainVC:RainViewController!
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override func drawRect(rect: CGRect) {
//        rainVC.raindropColor
        let bp:UIBezierPath = UIBezierPath()
        bp.lineWidth = 3.0
        rainVC.raindropColor.setStroke()
        rainVC.raindropColor.setFill()
        
        func t0(cgpoint:CGPoint)-> CGPoint {
            return(CGPoint(x: random() % Int(self.frame.size.width), y: random() % Int(self.frame.size.height)))
        }
        
        for _ in 0..<rainVC.numberOfRaindrops {
            let cg:CGPoint = t0(CGPoint(x: 0.0, y: 0.0))
            bp.moveToPoint(cg)
            bp.addArcWithCenter(cg, radius: CGFloat(rainVC.raindropRadius), startAngle: 0.0, endAngle: 6.28, clockwise: true)
            bp.stroke()
            bp.fill()
        }
        
        bp.stroke()
        bp.fill()
    }

}
