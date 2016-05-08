//
//  FernMaker.swift
//  Sankati_Botanical App
//
//  Created by Sankati,Vignan on 3/31/16.
//  Copyright © 2016 Sankati,Vignan. All rights reserved.
//  compiled in iPhone6s

import Foundation
import UIKit

class FernMaker {
    var points:[CGPoint] = []
    var tempPoint:CGPoint = CGPoint(x: 0.0, y: 0.0)
    
    func t0(cgpoint:CGPoint)-> CGPoint {
        return(CGPoint(x: 0.0, y: (0.16 * cgpoint.y)))
    }
    
    func t1(cgpoint:CGPoint) -> CGPoint {
        return(CGPoint(x: (((0.85 * cgpoint.x) + (0.04 * cgpoint.y))), y: (((-0.04 * cgpoint.x) + (0.85 * cgpoint.y) + 1.6))))
    }
    
    func t2(cgpoint:CGPoint) -> CGPoint {
        return(CGPoint(x: (((0.2 * cgpoint.x) - (0.26 * cgpoint.y))), y: (((0.23 * cgpoint.x) + (0.22 * cgpoint.y) + 1.6))))
    }
    
    func t3(cgpoint:CGPoint) -> CGPoint {
        return(CGPoint(x: (((-0.15 * cgpoint.x) + (0.28 * cgpoint.y))), y: (((0.26 * cgpoint.x) + (0.24 * cgpoint.y) + 0.44))))
    }
    
    func generateFern(i:Int) {
        
        points.append(t0(CGPoint(x: 0.5, y: 2.5)))
        print(i)
        for k in 0...i-1 {
            print(k)
            let r:Int = random()%100
//            To get line in the leaf implement this if block
//            if r < 1 {
//                points.append(t0(points[k]))
//            }
            if r < 7 {
                points.append(t2(points[k]))
            }
            else if r < 94 {
                points.append(t1(points[k]))
            }
            else {
                points.append(t3(points[k]))
            }
            print(points[k])
        }
    }
}