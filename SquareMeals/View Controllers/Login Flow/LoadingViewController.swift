//
//  LoadingViewController.swift
//  SquareMeals
//
//  Created by Zachary Shakked on 10/24/17.
//  Copyright © 2017 Shakd, LLC. All rights reserved.
//

import UIKit

public protocol LoadingViewControllerDelegate: class {
    func loadingViewControllerDidLoad(controller: LoadingViewController)
    func loadingViewControllerTryAgainButtonPressed(controller: LoadingViewController)
}

public final class LoadingViewController: UIViewController {

    public weak var delegate: LoadingViewControllerDelegate?
    
    @IBOutlet fileprivate weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet fileprivate weak var tryAgainButton: UIButton!
    
    public enum State {
        case loading, iCloudError
    }
    
    public var state: State = .loading {
        didSet {
            if state == .loading {
                startLoading()
            } else {
                stopLoading()
                showCloudKitError()
            }
        }
    }
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        delegate?.loadingViewControllerDidLoad(controller: self)
    }
    
    fileprivate func startLoading() {
        tryAgainButton.alpha = 0.0
        tryAgainButton.isEnabled = false
        activityIndicatorView.startAnimating()
    }
    
    fileprivate func stopLoading() {
        activityIndicatorView.stopAnimating()
    }
    
    fileprivate func showCloudKitError() {
        let alert = UIAlertController(title: "iCloud Error", message: "This application needs iCloud to function. Ensure you have iCloud & iCloud Drive enabled.", preferredStyle: .alert)
        let okay = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alert.addAction(okay)
        
        present(alert, animated: true)
        
        tryAgainButton.alpha = 1.0
        tryAgainButton.isEnabled = true
    }
    
    //MARK:- IBActions
    
    @IBAction func tryAgainButtonPressed(_ sender: Any) {
        delegate?.loadingViewControllerTryAgainButtonPressed(controller: self)
    }

}
