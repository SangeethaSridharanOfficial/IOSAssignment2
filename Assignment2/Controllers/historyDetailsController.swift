//
//  historyDetailsController.swift
//  Assignment2
//
//  Created by user202299 on 10/29/21.
//

import UIKit

class historyDetailsController: UIViewController {
    var historyObj: History?

    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var name: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = historyObj?.name
        updateView()
        // Do any additional setup after loading the view.
    }
    
    func updateView() {
        name.text = historyObj?.name
        quantity.text = "\(historyObj?.quantity ?? 0)"
        date.text = historyObj?.date
        amount.text = "\(historyObj?.total ?? 0)"
    }
    
    
}
