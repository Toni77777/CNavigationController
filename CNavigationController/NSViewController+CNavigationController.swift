//
//  NSViewController+CNavigationController.swift
//  CNavigationController
//
//  Created by Anton Paliakou on 8/6/21.
//

import Cocoa

// MARK: - Embed/Remove ViewController

extension NSViewController {
    
    // MARK: - Public
    
    public func embedViewController(_ viewController: NSViewController) {
        addChild(viewController)
        viewController.view.frame = self.view.frame
        viewController.view.autoresizingMask = [.height, .width]
        view.addSubview(viewController.view)
    }
    
    public func removeEmbedViewController(_ viewController: NSViewController) {
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
}

// MARK: - Associated CNavigationController

extension NSViewController {
    
    // MARK: - Private
    
    private static var associatedNavigationControllerKey = "CNavigationController"
   
    // MARK: - Public
    
    public var navigationController: CNavigationController? {
        get {
            return objc_getAssociatedObject(self, &NSViewController.associatedNavigationControllerKey) as? CNavigationController
        } set {
            objc_setAssociatedObject(
                self,
                &NSViewController.associatedNavigationControllerKey,
                newValue,
                objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN
            )
      }
   }
}
