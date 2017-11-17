//
//  SMTabBarController.swift
//  SquareMeals
//
//  Created by Zachary Shakked on 11/16/17.
//  Copyright © 2017 Shakd, LLC. All rights reserved.
//

import UIKit

public final class SMTabBarController: UIViewController {

    @IBOutlet weak var tabBarView: UIView!
    
    public fileprivate(set) var selectedIndex: Int = 0
    public var viewControllers: [UIViewController]
    
    
    @IBOutlet weak var tabBarButton0: UIButton!
    @IBOutlet weak var tabBarButton1: UIButton!
    @IBOutlet weak var tabBarButton2: UIButton!
    
    public init(viewControllers: [UIViewController], selectedIndex: Int) {
        self.viewControllers = viewControllers
        self.selectedIndex = selectedIndex
        super.init(nibName: "SMTabBarController", bundle: Bundle.main)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        // Add the new view controller
        let newlySelectedViewController = viewControllers[selectedIndex]
        addChildViewController(newlySelectedViewController)
        newlySelectedViewController.view.frame = view.frame
        view.insertSubview(newlySelectedViewController.view, belowSubview: tabBarView)
        didMove(toParentViewController: newlySelectedViewController)
        
        updateTabBarButtons()
    }
    
    @IBAction func tabBarButtonPressed(_ sender: UIButton) {
        
        switch sender {
        case tabBarButton0:
            setSelectedViewController(atIndex: 0)
            
        case tabBarButton1:
            setSelectedViewController(atIndex: 1)
            
        case tabBarButton2:
            setSelectedViewController(atIndex: 2)
            
        default:
            break
        }

    }

    public func setSelectedViewController(atIndex index: Int) {
    
        guard index < viewControllers.count && index >= 0 else {
            fatalError("SMTabBarcontroller index out of bounds.")
        }
        
        guard index != selectedIndex else {
            // Current index is already active
            return
        }
        
        // Remove currently selected view controller
        let currentlySelctedViewController = viewControllers[selectedIndex]
        currentlySelctedViewController.removeFromParentViewController()
        currentlySelctedViewController.didMove(toParentViewController: self)
        currentlySelctedViewController.view.removeFromSuperview()
        
        // Add the new view controller
        let newlySelectedViewController = viewControllers[index]
        addChildViewController(newlySelectedViewController)
        newlySelectedViewController.view.frame = view.frame
        view.insertSubview(newlySelectedViewController.view, belowSubview: tabBarView)
        didMove(toParentViewController: newlySelectedViewController)
        
        selectedIndex = index
        updateTabBarButtons()
    }
    
    fileprivate func updateTabBarButtons() {
        let tabBarButton0Image = selectedIndex == 0 ? viewControllers[0].tabBarItem.selectedImage : viewControllers[0].tabBarItem.image
        let tabBarButton1Image = selectedIndex == 1 ? viewControllers[1].tabBarItem.selectedImage : viewControllers[1].tabBarItem.image
        let tabBarButton2Image = selectedIndex == 2 ? viewControllers[2].tabBarItem.selectedImage : viewControllers[2].tabBarItem.image
        
        
        tabBarButton0.setImage(tabBarButton0Image, for: .normal)
        tabBarButton1.setImage(tabBarButton1Image, for: .normal)
        tabBarButton2.setImage(tabBarButton2Image, for: .normal)
    }

}
