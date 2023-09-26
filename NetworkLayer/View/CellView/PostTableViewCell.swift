//
//  PostTableViewCell.swift
//  NetworkLayer
//
//  Created by Barış Aydemir on 22.09.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var postLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
