//
//  SplashVC.swift
//  FurkanTask
//
//  Created by Furkan Oğuz on 15.09.2022.
//

import UIKit

final class SplashVC: BaseVC{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            appManager.director.startHome()
    }
}
