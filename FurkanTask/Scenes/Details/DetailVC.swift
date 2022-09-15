//
//  DetailVC.swift
//  FurkanTask
//
//  Created by Furkan Oğuz on 15.09.2022.
//

import UIKit

class DetailVC: BaseVC {
    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var authorNameLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!

    var data: Article!
    var viewModel = DetailVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        dateLbl.text = data.publishedAt
        titleLbl.text = data.title
        authorNameLbl.text = data.author
        descriptionLbl.text = data.content
        
        if let url = data.urlToImage {
            imageDetail.load(url: URL(string: url)!)
               }
        // Do any additional setup after loading the view.
    }
    @IBAction func favoriteAddButton(_ sender: Any) {
        appManager.cache.appendData(data: data)
        viewModel.alert(title: "Info", message: "Successfully added to favorites", vc: self)

    }
    
    @IBAction func trashBtnClicked(_ sender: Any) {
        appManager.cache.removeData(data: data)
       viewModel.alert(title: "Info", message: "Successfully deleted from favorites", vc: self)

    }
    @IBAction func shareButton(_ sender: Any) {
    }
    @IBAction func newsSourceButton(_ sender: Any) {
        let vc = NewsSourceVC.instantiate(storyboard: .detail)
        vc.url = data.url ?? ""
        self.present(vc, animated: true, completion: nil)
    }
}
