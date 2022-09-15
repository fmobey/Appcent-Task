//
//  FavoriteVC.swift
//  FurkanTask
//
//  Created by Furkan Oğuz on 15.09.2022.
//

import UIKit

final class FavoriteVC: BaseVC {

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomeCellTableViewCell.nibName, forCellReuseIdentifier: HomeCellTableViewCell.identifier)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

}


extension FavoriteVC :  UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = appManager.cache.articleData[indexPath.row]
        
        
        
        let vc = DetailVC.instantiate(storyboard: .detail)
        vc.data = data
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            appManager.cache.removeData(data: appManager.cache.articleData[indexPath.row])
                tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 250
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appManager.cache.articleData.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: HomeCellTableViewCell.identifier, for: indexPath) as! HomeCellTableViewCell
           let data = appManager.cache.articleData[indexPath.row]
           cell.titleLbl.text = data.title
           cell.infoLbl.text = data.articleDescription
//           cell.backgroundColor = .orange
           if let url = data.urlToImage {
               cell.imageCell.load(url: URL(string: url)!)
                  }

           return cell
       }
    
}
