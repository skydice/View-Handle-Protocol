//
//  RotatableHelper.swift
//  ViewHandleProtocol
//
//  Created by Han Yong Kang on 2016. 11. 8..
//  Copyright © 2016년 Han Yong Kang. All rights reserved.
//

public class RotatableHelper: NSObject, UIGestureRecognizerDelegate {
    var view: UIView?
    
    public init(view: UIView) {
        self.view = view
    }
    
    public func addRotatable() {
        let roatationGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotate))
        self.view?.addGestureRecognizer(roatationGesture)
        
        roatationGesture.delegate = self
    }
    
    @objc public func rotate(_ recognizer: UIRotationGestureRecognizer) {
        let rotation = recognizer.rotation
        
        self.view?.transform = CGAffineTransform(rotationAngle: rotation)
    }

    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
