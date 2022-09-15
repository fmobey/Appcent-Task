//
//  AppManager.swift
//  FurkanTask
//
//  Created by Furkan Oğuz on 15.09.2022.
//

import Foundation

let appManager = AppManager()

final class AppManager {
    let director = AppDirector()
    let network = NetworkManager()
    let constants = AppConstants()
    let cache = CacheManager()
}

final class CacheManager {
    var articleData: [Article] = []
    
    func appendData(data: Article) {
        if self.articleData.filter({ $0.url == data.url }).count > 0 {
            return
        }
        self.articleData.append(data)
    }
    
    func removeData(data: Article) {
        if let idx = articleData.firstIndex(where: { $0.url == data.url }) {
            articleData.remove(at: idx)
        }
    }
}
