//
//  Rotatable.swift
//  ViewHandleProtocol
//
//  Created by Han Yong Kang on 2016. 11. 8..
//  Copyright © 2016년 Han Yong Kang. All rights reserved.
//

public protocol Rotatable {
    var rotatableHelper: RotatableHelper? { get set }
}

public extension Rotatable {
    public func addRotatable() {
        self.rotatableHelper?.addRotatable()
    }
}
