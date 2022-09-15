//
//  TabbarVC.swift
//  FurkanTask
//
//  Created by Furkan Oğuz on 15.09.2022.
//

import UIKit

enum TabbarTitles: String {
    case homePage = "Ana Sayfa"
    case favorites = "Favoriler"
    case categories = "Kategoriler"
}

enum IconNames: String {
    case homeIcon = "homeIcon"
    case favoriteIcon = "heart"
    case selecetedFavoriteIcon = "selectedHeart"
    case selectedHomeIcon = "selectedHomeIcon"
}

final class TabbarVC: UITabBarController {
    
    var menuTrigg: (() -> ())?
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [getHomeVC(),getFavoriteVC()]
    }
    
    func getHomeVC() -> UIViewController {
        let item = HomeVC.instantiate(storyboard: .main, bundle: nil, identifier: nil)
        item.menuTrigg = { [weak self] in
            self?.menuTrigg?()
        }
        let itemIcon = UITabBarItem(title: TabbarTitles.homePage.rawValue,
                                    image: UIImage(named: IconNames.homeIcon.rawValue)?.withRenderingMode(.alwaysOriginal),
                                    selectedImage: UIImage(named: IconNames.selectedHomeIcon.rawValue)?.withRenderingMode(.alwaysOriginal))
        item.tabBarItem = itemIcon
        return item
    }
    func getFavoriteVC() -> UIViewController{
        let item = FavoriteVC.instantiate(storyboard: .favorite, bundle: nil, identifier: nil)
        item.menuTrigg = { [weak self ] in
            self?.menuTrigg?()
        }
        let itemIcon = UITabBarItem(title: TabbarTitles.favorites.rawValue,
                                    image: UIImage(named:IconNames.favoriteIcon.rawValue )?.withRenderingMode(.alwaysOriginal),
                                    selectedImage:UIImage(named:IconNames.selecetedFavoriteIcon.rawValue )?.withRenderingMode(.alwaysOriginal) )
        
        item.tabBarItem = itemIcon
        return item
    }
    
    func getSplashVC() -> UIViewController {
        let item = SplashVC.instantiate(storyboard: .main, bundle: nil, identifier: nil)
        let itemIcon = UITabBarItem(title: TabbarTitles.homePage.rawValue,
                                    image: UIImage(named: IconNames.homeIcon.rawValue),
                                    selectedImage: UIImage(named: IconNames.homeIcon.rawValue))
        item.tabBarItem = itemIcon
        return item
    }
}
