//
//  TableDataSourceDelegate.swift
//  NetworkLayer
//
//  Created by Barış Aydemir on 17.09.2023.
//

import Foundation
import UIKit


class TableDataSourceDelegate: NSObject, UITableViewDelegate,UITableViewDataSource {
    var viewController:ViewController?
    
    init(viewController: ViewController?) {
        self.viewController = viewController
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewController?.userList.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let viewController = viewController else {
            return UITableViewCell()
        }
        
        let userList = viewController.userList
        let tableList = userList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "theCell", for: indexPath) as! TableViewCell
        cell.nameLabel.text = tableList.name
        cell.userNameLabel.text = tableList.username
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = viewController?.userList[indexPath.row]
        self.viewController?.performSegue(withIdentifier: "userToDetail", sender: user)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
