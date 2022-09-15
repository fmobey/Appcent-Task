//
//  ViewController.swift
//  FurkanTask
//
//  Created by Furkan Oğuz on 15.09.2022.
//

import UIKit

final class HomeVC: BaseVC {

    var viewModel = HomeVM()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        tableView.register(HomeCellTableViewCell.nibName, forCellReuseIdentifier: HomeCellTableViewCell.identifier)
        viewModel.refreshTableView = { [weak self] in
            self?.tableView.reloadData()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
//            appManager.director.startFavoriteVC()
        })
    }

}

extension HomeVC : UISearchBarDelegate, UISearchDisplayDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        viewModel.getData(search: searchText)

    }
}

extension HomeVC :  UITableViewDelegate, UITableViewDataSource{
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .none {
//
//            }
//          }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = viewModel.articles[indexPath.row]
        
        
        
        let vc = DetailVC.instantiate(storyboard: .detail)
        vc.data = data
//        if let url = data.urlToImage {
//            vc.imageDetail.load(url: URL(string: url)!)
//               }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 250
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.articles.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: HomeCellTableViewCell.identifier, for: indexPath) as! HomeCellTableViewCell
           let data = viewModel.articles[indexPath.row]
           cell.titleLbl.text = data.title
           cell.infoLbl.text = data.articleDescription
//           cell.backgroundColor = .orange
           if let url = data.urlToImage {
               cell.imageCell.load(url: URL(string: url)!)
                  }

           return cell
       }
    
}
