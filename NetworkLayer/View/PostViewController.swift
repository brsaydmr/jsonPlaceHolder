//
//  PostViewController.swift
//  NetworkLayer
//
//  Created by Barış Aydemir on 22.09.2023.
//

import UIKit

class PostViewController: UIViewController {
    
    @IBOutlet weak var postTableView: UITableView!
    var dataSourceDelegate: PostTableDataDelegate?
    
    
    var postList = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSourceDelegate = PostTableDataDelegate(postviewController: self)
        postTableView.dataSource = dataSourceDelegate
        postTableView.delegate = dataSourceDelegate
        
        NetworkManager.shared.getPost { [weak self] result in
            switch result {
            case .success(let posts):
                self?.postList = posts
                DispatchQueue.main.async {
                    self?.postTableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "postToDetail" {
            let post = sender as? Post
            let gidilecekVC = segue.destination as! PostDetailViewController
            
            gidilecekVC.postDetail = post
        }
    }
}
