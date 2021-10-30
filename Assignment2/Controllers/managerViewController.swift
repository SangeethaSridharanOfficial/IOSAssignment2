//
//  managerViewController.swift
//  Assignment2
//
//  Created by user202299 on 10/27/21.
//

import UIKit

class managerViewController: UIViewController {
    
    var historyArr = [History]()
    var productsArr = [Products]()
    var productManager: ProductManager?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "historyItems"{
            let historyVC = segue.destination as! historyItemsController
            historyVC.historyArr = historyArr
        }else {
            let restockVC = segue.destination as! restockController
            restockVC.productsArr = productsArr
            restockVC.productManager = productManager
        }
        
    }

}
