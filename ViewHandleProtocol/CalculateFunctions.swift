//
//  CalculateFunctions.swift
//  ViewHandleProtocol
//
//  Created by Han Yong Kang on 2016. 11. 4..
//  Copyright © 2016년 Han Yong Kang. All rights reserved.
//

class CalculateFunctions {
    typealias Distance = CGPoint
    
    static func CGRectScale(_ rect: CGRect, wScale: CGFloat, hScale: CGFloat) -> CGRect {
        return CGRect(x: rect.origin.x * wScale, y: rect.origin.y * hScale, width: rect.size.width * wScale, height: rect.size.height * hScale)
    }
    
    static func CGPointDifference(_ point1: CGPoint, point2: CGPoint) -> Distance {
        let x = point1.x - point2.x
        let y = point1.y - point2.y
        
        return CGPoint(x: x, y: y)
    }
}
