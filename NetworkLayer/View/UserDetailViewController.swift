//
//  UserDetailViewController.swift
//  NetworkLayer
//
//  Created by Barış Aydemir on 22.09.2023.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var adressLabel: UILabel!
    
    var userDetail:User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let u = userDetail {
            nameLabel.text = "Name : \(u.name)"
            userNameLabel.text = "User Name : \(u.username)"
            emailLabel.text = "E-Mail : \(u.email)"
            adressLabel.text = "Address : \(u.address.city) - \(u.address.street)"
        }
    }
    
}
