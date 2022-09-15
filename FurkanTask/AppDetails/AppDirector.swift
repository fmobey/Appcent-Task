//
//  AppDirector.swift
//  FurkanTask
//
//  Created by Furkan Oğuz on 15.09.2022.
//

import UIKit

final class AppDirector {
    
    private var window = UIWindow()
    private var navigationController: UINavigationController = UINavigationController()
    
    init() {}
    
    func appStart() {
        //let viewController = UINavigationController(rootViewController: SplashVC.instantiate(storyboard: .main, bundle: nil, identifier: nil))
        let viewController = SplashVC.instantiate(storyboard: .main, bundle: nil, identifier: nil)
        switchRootViewController(rootViewController: viewController, animated: true, completion: nil)
    }
    
    func startHome() {
        let viewController = SideMenu()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.setNavigationBarHidden(false, animated: false)
        self.navigationController = navigationController
        self.switchRootViewController(rootViewController: navigationController, animated: false, completion: nil)
    }
    
    func startFavoriteVC() {
        let viewController = FavoriteVC()
        navigationController.pushViewController(viewController, animated: true)
    }
    
}

extension AppDirector {
    func switchRootViewController(rootViewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
            if animated {
                UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: {
                    let oldState: Bool = UIView.areAnimationsEnabled
                    UIView.setAnimationsEnabled(false)
                    self.window.rootViewController = rootViewController
                    self.window.makeKeyAndVisible()
                    UIView.setAnimationsEnabled(oldState)
                }, completion: { (finished: Bool) -> () in
                    if (completion != nil) {
                        completion!()
                    }
                })
            } else {
                window.rootViewController = rootViewController
            }
        window.makeKeyAndVisible()
        }
    
    func getTopNavigationController() -> UINavigationController? {
        if let vc = UIApplication.getTopViewController() {
            return vc.navigationController
        }
        return nil
    }
}
