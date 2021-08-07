//
//  CNavigationController.swift
//  CNavigationController
//
//  Created by Anton Paliakou on 8/6/21.
//

import Cocoa

open class CNavigationController: NSViewController {
    
    // MARK: - Properties
    
    private var viewControllers: [NSViewController] = []
    
    // MARK: - Init
    
    public init(rootViewController: NSViewController) {
        super.init(nibName: nil, bundle: nil)
        pushViewController(rootViewController, animated: false)
    }

    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    deinit {
        Swift.print("[CNavigationController] deinit")
    }
    
    open override func loadView() {
        view = NSView()
        view.wantsLayer = true
    }
    
    // MARK: - Push
    
    public func pushViewController(_ viewController: NSViewController, animated: Bool) {
        viewController.navigationController = self
        embedViewController(viewController)
        viewControllers.append(viewController)
    }
    
    // MARK: - Pop
    
    @discardableResult
    func popViewController(animated: Bool) -> NSViewController? {
        guard viewControllers.count > 1, let lastViewController = viewControllers.popLast() else { return nil }
        removeEmbedViewController(lastViewController)
        return lastViewController
    }
}
