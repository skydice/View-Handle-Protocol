//
//  ResizableHelper.swift
//  ViewHandleProtocol
//
//  Created by Han Yong Kang on 2016. 11. 8..
//  Copyright © 2016년 Han Yong Kang. All rights reserved.
//

public class ResizableHelper {
    var view: UIView?
    var initialBounds: CGRect?
    var beginningOfFirstTouch: CGPoint?
    var beginningOfSecondTouch: CGPoint?
    
    public init(view: UIView) {
        self.view = view
    }
    
    public func addResizable() {
        let resizePinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(resize))
        self.view?.addGestureRecognizer(resizePinchGesture)
    }
    
    @objc public func resize(_ recognizer: UIPinchGestureRecognizer) {
        if recognizer.numberOfTouches < 2 {
            return
        }
        
        switch recognizer.state {
        case .began:
            self.initialBounds = self.view?.bounds
            self.beginningOfFirstTouch = recognizer.location(ofTouch: 0, in: self.view)
            self.beginningOfSecondTouch = recognizer.location(ofTouch: 1, in: self.view)
            break
        case .changed:
            guard let initialBounds = self.initialBounds,
                let beginningOfFirstTouch = self.beginningOfFirstTouch,
                let beginningOfSecondTouch = self.beginningOfSecondTouch else {
                break
            }
            
            let pointOfFirstTouch = recognizer.location(ofTouch: 0, in: self.view)
            let pointOfSecondTouch = recognizer.location(ofTouch: 1, in: self.view)
            
            let firstTouchDistance = CalculateFunctions.CGPointDifference(beginningOfFirstTouch, point2: pointOfFirstTouch)
            let secondTouchDistance = CalculateFunctions.CGPointDifference(beginningOfSecondTouch, point2: pointOfSecondTouch)
            
            let wScaleDifference = subtract(p1: firstTouchDistance.x, p2: secondTouchDistance.x, ab: compare(p1: beginningOfFirstTouch.x, p2: beginningOfSecondTouch.x))
            let hScaleDifference = subtract(p1: firstTouchDistance.y, p2: secondTouchDistance.y, ab: compare(p1: beginningOfFirstTouch.y, p2: beginningOfSecondTouch.y))
            
            let wScale = CGFloat(wScaleDifference / initialBounds.width + 1)
            let hScale = CGFloat(hScaleDifference / initialBounds.height + 1)
            
            let scaleRect = CalculateFunctions.CGRectScale(initialBounds, wScale: wScale, hScale: hScale)
            
            self.view?.bounds = scaleRect
            break
        default:
            break
        }
    }
    
    fileprivate func compare(p1: CGFloat, p2: CGFloat) -> Bool {
        return p1 < p2
    }
    
    fileprivate func subtract(p1: CGFloat, p2: CGFloat, ab: Bool) -> CGFloat {
        if ab {
            return p1 - p2
        } else {
            return p2 - p1
        }
    }
}
