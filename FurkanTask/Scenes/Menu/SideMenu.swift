//
//  SideMenu.swift
//  FurkanTask
//
//  Created by Furkan Oğuz on 15.09.2022.
//

import UIKit


class SideMenu: BaseVC {
    
    let transition = SlideInTransition()
    var appTabbarController = TabbarVC()
    var mainController: UIViewController = UIViewController()
    
    
    fileprivate func showMenu() {
        let viewController = SideMenuVC.instantiate(storyboard: .sideMenu, bundle: nil, identifier: nil)
        viewController.modalPresentationStyle = .overCurrentContext
        viewController.transitioningDelegate = self
        transition.closeMenu = { [weak self] in
            self?.showHideTabbar(isHidden: false)
            viewController.dismiss(animated: true, completion: nil)
        }
        present(viewController, animated: true)
    }
    
    fileprivate func setupMainController() {
        mainController = UINavigationController(rootViewController: appTabbarController)
        appTabbarController.menuTrigg = { [weak self] in
            //self?.showSideMenu(show: true)
            self?.showHideTabbar(isHidden: true)
            self?.showMenu()
        }
        view.addSubview(mainController.view)
        addChild(mainController)
        mainController.didMove(toParent: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)

    }
    
    private func showHideTabbar(isHidden: Bool) {

        self.appTabbarController.setTabBar(hidden: isHidden)
        
    }
}

extension SideMenu {
    
    func showSideMenu(show: Bool) {
        if show {
            UIView.animate(withDuration: 0.5, animations: {
                self.mainController.view.frame.origin.x = self.mainController.view.frame.width - 90
            }) { (_) in
                // Menu Opened
            }
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.mainController.view.frame.origin.x = 0
            }) { (_) in
                // Menu Closed
            }
        }
    }
    
}

extension SideMenu: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}
