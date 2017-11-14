//
//  Array+Extensions.swift
//  Command
//
//  Created by Zachary Shakked on 3/2/16.
//  Copyright © 2016 Shakd, LLC. All rights reserved.
//

import UIKit

public extension Array {
    public subscript(safe index: Int) -> Element? {
        guard index < count else { return nil }
        return self[index]
    }
    
    public subscript (safe subRange: Range<Int>) -> ArraySlice<Element> {
        let from = startIndex.advanced(by: subRange.lowerBound) > 0 ? startIndex.advanced(by: subRange.lowerBound) : 0
        let to = subRange.upperBound > count - 1 ? count - 1 : subRange.upperBound
        
        guard from < to else { return [] }
        
        return self[from ..< to]
    }
    
    public func takeFirst(_ elementCount: Int) -> Array {
        var elementCount = elementCount
        if (elementCount > count) {
            elementCount = count
        }
        return Array(self[0..<elementCount])
    }
    
    public func takeLast(_ elementCount: Int) -> Array {
        var elementCount = elementCount
        if (elementCount > count) {
            elementCount = count
        }
        return Array(self[(count - elementCount)..<count])
    }
}
