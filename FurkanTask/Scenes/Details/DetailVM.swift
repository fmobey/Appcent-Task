//
//  DetailVM.swift
//  FurkanTask
//
//  Created by Furkan Oğuz on 15.09.2022.
//

import Foundation
import UIKit

class DetailVM : BaseVM{
    
    func alert(title: String, message: String, vc: UIViewController){
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            vc.present(alert, animated: true, completion: nil)
        }
    
}
