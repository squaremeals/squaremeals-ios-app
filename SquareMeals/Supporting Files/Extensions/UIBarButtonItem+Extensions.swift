//
//  UIBarButtonItem+Extensions.swift
//  Instagrowth
//
//  Created by Zachary Shakked on 1/11/16.
//  Copyright © 2016 Zachary Shakked. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    public func startRightActivityIndicator() {
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityIndicator.startAnimating()
        let activityIndicatorBarButton = UIBarButtonItem(customView: activityIndicator)
        navigationItem.rightBarButtonItem = activityIndicatorBarButton
    }
    
    public func startLeftActivityIndicator() {
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityIndicator.startAnimating()
        let activityIndicatorBarButton = UIBarButtonItem(customView: activityIndicator)
        navigationItem.leftBarButtonItem = activityIndicatorBarButton
    }
    
    public func stopLeftActivityIndicator() {
        navigationItem.leftBarButtonItem = nil
    }
    
    public func stopRightActivityIndicator() {
        navigationItem.rightBarButtonItem = nil
    }
}
