//
//  NSURL+Extensions.swift
//  Instagrowth
//
//  Created by Zachary Shakked on 1/11/16.
//  Copyright © 2016 Zachary Shakked. All rights reserved.
//

import UIKit

public extension URL {
    public func parameters() -> [String : String] {
        var queryStrings = [String: String]()
        if let query = self.query {
            for qs in query.components(separatedBy: "&") {
                let key = qs.components(separatedBy: "=")[0]
                var value = qs.components(separatedBy: "=")[1]
                value = value.replacingOccurrences(of: "+", with: " ")
                value = value.removingPercentEncoding!
                queryStrings[key] = value
            }
        }
        return queryStrings
    }
}
