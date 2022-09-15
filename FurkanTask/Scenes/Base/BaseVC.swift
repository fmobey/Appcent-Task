//
//  BaseVC.swift
//  FurkanTask
//
//  Created by Furkan Oğuz on 15.09.2022.
//

import UIKit

class BaseVC: UIViewController {
    
    var navigationBarHidden: Bool = false
    var menuTrigg: (() -> ())?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(navigationBarHidden, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let tabbarControl = self.tabBarController else { return }
        let btn1 = UIButton(type: .custom)
        btn1.setImage(UIImage(named: IconNames.homeIcon.rawValue), for: .normal)
        btn1.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btn1.addTarget(self, action: #selector(menuTrigger), for: .touchUpInside)
        //let item1 = UIBarButtonItem(customView: btn1)
        tabbarControl.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(menuTrigger))
        tabbarControl.tabBar.backgroundColor = .white
        tabbarControl.tabBar.tintColor = .black
        //tabbarControl.navigationController?.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(menuTrigger))

        //tabbarControl.navigationController?.navigationItem.leftBarButtonItem = item1
    }
    
    @objc private func menuTrigger() {
        menuTrigg?()
    }
}
