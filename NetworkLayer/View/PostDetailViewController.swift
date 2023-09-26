//
//  PostDetailViewController.swift
//  NetworkLayer
//
//  Created by Barış Aydemir on 26.09.2023.
//

import UIKit

class PostDetailViewController: UIViewController {

    @IBOutlet weak var userIdLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    var postDetail:Post?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let p = postDetail {
            userIdLabel.text = String("User ID : \(p.id)")
            titleLabel.text = p.title.capitalized
            bodyLabel.text = p.body.capitalized
        }
    }
   
}
