//
//  mainTableView.swift
//  Assignment2
//
//  Created by user202299 on 10/25/21.
//

import UIKit

class mainTableView: UITableViewCell {

    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var priceText: UILabel!
    @IBOutlet weak var quantityText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
