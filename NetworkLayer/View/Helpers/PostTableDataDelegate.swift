//
//  PostTableDataDelegate.swift
//  NetworkLayer
//
//  Created by Barış Aydemir on 22.09.2023.
//

import Foundation
import UIKit

class PostTableDataDelegate: NSObject, UITableViewDelegate,UITableViewDataSource {
    var postviewController:PostViewController?

    init(postviewController: PostViewController? = nil) {
        self.postviewController = postviewController
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postviewController?.postList.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let vc = postviewController else {
            return UITableViewCell()
        }
        let posts = vc.postList
        let tableList = posts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
        cell.postLabel.text = tableList.title.capitalized
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = postviewController?.postList[indexPath.row]
        self.postviewController?.performSegue(withIdentifier: "postToDetail", sender: post)
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
