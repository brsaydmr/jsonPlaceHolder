//
//  ViewController.swift
//  NetworkLayer
//
//  Created by Barış Aydemir on 16.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var userList = [User]()
    var dataSourceDelegate: TableDataSourceDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSourceDelegate = TableDataSourceDelegate(viewController: self)
        tableView.dataSource = dataSourceDelegate
        tableView.delegate = dataSourceDelegate
        
        NetworkManager.shared.getUser { [weak self] result in
            switch result {
            case .success(let users):
                self?.userList = users
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "userToDetail" {
            let user = sender as? User
            let gidilecekVC = segue.destination as! UserDetailViewController

            gidilecekVC.userDetail = user
        }
        
    }
    
}
