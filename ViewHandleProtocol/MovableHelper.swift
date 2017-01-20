//
//  MovableHelper.swift
//  ViewHandleProtocol
//
//  Created by Han Yong Kang on 2016. 11. 8..
//  Copyright © 2016년 Han Yong Kang. All rights reserved.
//

public class MovableHelper {
    var view: UIView?
    var initialCenter: CGPoint?
    var initialLocation: CGPoint?
    var touchLocation: CGPoint?
    
    public init(view: UIView) {
        self.view = view
    }
    
    public func addMovable() {
        let movePanGesture = UIPanGestureRecognizer(target: self, action: #selector(move))
        self.view?.addGestureRecognizer(movePanGesture)
    }
    
    @objc public func move(_ recognizer: UIPanGestureRecognizer) {
        self.touchLocation = recognizer.location(in: self.view?.superview)
        
        switch recognizer.state {
        case .began:
            self.initialCenter = view?.center
            self.initialLocation = self.touchLocation
            break
        case .changed:
            guard let center = estimatedCenter() else {
                break
            }
            
            self.view?.center = center
            break
        default:
            break
        }
    }
    
    fileprivate func estimatedCenter() -> CGPoint? {
        guard let view = self.view,
            let initialCenter = self.initialCenter,
            let initialLocation = self.initialLocation,
            let touchLocation = self.touchLocation else {
            return nil
        }
        
        var newCenterX = initialCenter.x + (touchLocation.x - initialLocation.x)
        var newCenterY = initialCenter.y + (touchLocation.y - initialLocation.y)
        
        if (self.isOutOfRangeHorizontally(pointX: newCenterX)) {
            newCenterX = view.center.x
        }
        
        if (self.isOutOfRangeVertically(pointY: newCenterY)) {
            newCenterY = view.center.y
        }
        
        let newCenter = CGPoint(x: newCenterX, y: newCenterY)
        
        return newCenter
    }
    
    fileprivate func isOutOfRangeHorizontally(pointX: CGFloat) -> Bool {
        guard let view = self.view, let superview = view.superview else {
            return false
        }
        
        return (pointX - 0.5 * view.frame.width) < 0 || (pointX + 0.5 * view.frame.width) > superview.bounds.width
    }
    
    fileprivate func isOutOfRangeVertically(pointY: CGFloat) -> Bool {
        guard let view = self.view, let superview = view.superview else {
            return false
        }
        
        return (pointY - 0.5 * view.frame.height) < 0 || (pointY + 0.5 * view.frame.height) > superview.bounds.height
    }
}
