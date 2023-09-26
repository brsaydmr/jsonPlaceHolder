//
//  CommentDetailViewController.swift
//  NetworkLayer
//
//  Created by Barış Aydemir on 26.09.2023.
//

import UIKit

class CommentDetailViewController: UIViewController {

    @IBOutlet weak var postIDLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var bodyLabel: UILabel!
    
    var commentDetail:Comment?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let c = commentDetail {
            postIDLabel.text = "Post ID : \(c.id)"
            nameLabel.text = "Name : \(c.name.capitalized)"
            emailLabel.text = "E-Mail : \(c.email.capitalized)"
            bodyLabel.text = "Post : \(c.body.capitalized)"
        }

    }


}
