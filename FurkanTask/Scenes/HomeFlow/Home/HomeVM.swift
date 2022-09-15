//
//  HomeVM.swift
//  FurkanTask
//
//  Created by Furkan Oğuz on 15.09.2022.
//

import Foundation


final class HomeVM: BaseVM {
    
    private var apiKey : String = "545167923a0040ba823206b05bac16e6"
    fileprivate var currentList : [String] = []
    var articles : [Article] = []
    var refreshTableView: (() -> Void)?
 
    
    func getData(search : String) {
        appManager.network.getData(url: "https://newsapi.org/v2/everything?q=\(search)&apiKey=\(apiKey)") { [weak self] (response: NewsApiModel?) in

            self?.articles = response?.articles ?? []
            self?.refreshTableView?()
        }
    }
}
