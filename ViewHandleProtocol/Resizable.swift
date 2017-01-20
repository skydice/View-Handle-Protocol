//
//  Resizable.swift
//  ViewHandleProtocol
//
//  Created by Han Yong Kang on 2016. 11. 4..
//  Copyright © 2016년 Han Yong Kang. All rights reserved.
//

public protocol Resizable {
    var resizableHelper: ResizableHelper? { get set }
}

public extension Resizable {
    public func addResizable() {
        self.resizableHelper?.addResizable()
    }
}
