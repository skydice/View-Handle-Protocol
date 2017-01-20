//
//  RescalableHelper.swift
//  ViewHandleProtocol
//
//  Created by Han Yong Kang on 2016. 11. 8..
//  Copyright © 2016년 Han Yong Kang. All rights reserved.
//

public class RescalableHelper {
    var view: UIView?
    var initialBounds: CGRect?
    
    public init(view: UIView) {
        self.view = view
    }
    
    public func addRescalable() {
        let rescalePinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(rescale))
        self.view?.addGestureRecognizer(rescalePinchGesture)
    }
    
    @objc public func rescale(_ recognizer: UIPinchGestureRecognizer) {
        if recognizer.numberOfTouches < 2 {
            return
        }
        
        switch recognizer.state {
        case .began:
            self.initialBounds = self.view?.bounds
            break
        case .changed:
            guard let initialBounds = self.initialBounds else {
                break
            }
            
            let scale = recognizer.scale
            let scaleRect = CalculateFunctions.CGRectScale(initialBounds, wScale: CGFloat(scale), hScale: CGFloat(scale))
            
            self.view?.bounds = scaleRect
            break
        default:
            break
        }
    }
}
