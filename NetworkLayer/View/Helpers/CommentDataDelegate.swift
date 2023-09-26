//
//  CommentDataDelegate.swift
//  NetworkLayer
//
//  Created by Barış Aydemir on 22.09.2023.
//

import Foundation

import UIKit

class CommentDataDelegate: NSObject, UITableViewDelegate,UITableViewDataSource {
    var commentviewController:CommentViewController?
    
    init(commentviewController: CommentViewController? = nil) {
        self.commentviewController = commentviewController
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentviewController?.commentList.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as! CommentTableViewCell
        
        guard let vc = commentviewController else {
            return UITableViewCell()
        }
        let comments = vc.commentList
        let tableList = comments[indexPath.row]
        
        
        cell.idLabel.text = String("(\(tableList.id))")
        cell.nameLabel.text = String("Name : \(tableList.name.capitalized)")
        cell.emailLabel.text = String("E-mail : \(tableList.email.capitalized)")
        cell.bodyLabel.text = "Post : \(tableList.body.capitalized)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let comment = commentviewController?.commentList[indexPath.row]
        self.commentviewController?.performSegue(withIdentifier: "commentToDetail", sender: comment)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
