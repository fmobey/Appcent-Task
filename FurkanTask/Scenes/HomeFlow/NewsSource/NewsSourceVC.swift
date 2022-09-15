//
//  NewsSourceVC.swift
//  FurkanTask
//
//  Created by Furkan Oğuz on 15.09.2022.
//

import UIKit
import WebKit

class NewsSourceVC: BaseVC {
    
    var url: String = ""
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: url)!
        webView.load(URLRequest(url: url))
    }
}
