//
//  Movable.swift
//  ViewHandleProtocol
//
//  Created by Han Yong Kang on 2016. 11. 3..
//  Copyright © 2016년 Han Yong Kang. All rights reserved.
//

public protocol Movable {
    var movableHelper: MovableHelper? { get set }
}

public extension Movable {
    public func addMovable() {
        self.movableHelper?.addMovable()
    }
}
