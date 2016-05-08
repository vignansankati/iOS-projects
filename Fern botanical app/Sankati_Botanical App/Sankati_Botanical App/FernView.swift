//
//  FernView.swift
//  Sankati_Botanical App
//
//  Created by Sankati,Vignan on 4/2/16.
//  Copyright © 2016 Sankati,Vignan. All rights reserved.
//  compiled in iPhone6s

import UIKit

class FernView: UIView {

    var fernMaker:FernMaker!
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

    override func drawRect(rect: CGRect) {
        let bp:UIBezierPath = UIBezierPath()
        UIColor.blueColor().setFill()
        UIColor.blueColor().setStroke()

        var translatedPoint:CGPoint = CGPoint(x: 0.0, y: 0.0)
        
        for i in fernMaker.points {
            print(i)
            translatedPoint.x = (i.x + 4) * 33
            translatedPoint.y = (i.y + 2.5) * 29

            bp.moveToPoint(translatedPoint)
            bp.addArcWithCenter(translatedPoint, radius: 0.5, startAngle: 0.0, endAngle: 6.28, clockwise: true)
        }
        bp.stroke()
        bp.fill()
    }
}
