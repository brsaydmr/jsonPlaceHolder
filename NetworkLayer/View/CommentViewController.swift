//
//  CommentViewController.swift
//  NetworkLayer
//
//  Created by Barış Aydemir on 22.09.2023.
//

import UIKit

class CommentViewController: UIViewController {

    @IBOutlet weak var commentTableView: UITableView!
    
    var commentList = [Comment]()
    var dataSourceDelegate: CommentDataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSourceDelegate = CommentDataDelegate(commentviewController: self)
        commentTableView.delegate = dataSourceDelegate
        commentTableView.dataSource = dataSourceDelegate
        
        NetworkManager.shared.getComment { [weak self] result in
            switch result {
            case .success(let users):
                self?.commentList = users
                DispatchQueue.main.async {
                    self?.commentTableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "commentToDetail" {
            let comment = sender as? Comment
            let VC = segue.destination as! CommentDetailViewController

            VC.commentDetail = comment
        }
        
    }
    

}
