//
//  Scaleable.swift
//  ViewHandleProtocol
//
//  Created by Han Yong Kang on 2016. 11. 7..
//  Copyright © 2016년 Han Yong Kang. All rights reserved.
//

public protocol Rescalable {
    var rescalableHelper: RescalableHelper? { get set }
}

public extension Rescalable {
    public func addRescalable() {
        self.rescalableHelper?.addRescalable()
    }
}
