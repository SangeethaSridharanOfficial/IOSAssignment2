//
//  ViewController.swift
//  Assignment2
//
//  Created by user202299 on 10/23/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var productManager: ProductManager = ProductManager()
    var historyManager: HistoryManager = HistoryManager()
    @IBOutlet weak var productTableView: UITableView!
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    var selectedQuantity = 0
    var selectedPrice: Double = 0.0
    var tempQuantity = ""
    
    @IBAction func buyBtnClicked(_ sender: buyButton) {
        let name = nameLabel.text ?? "";
        let qty: String = quantityLabel.text ?? "0";
        if(Int(qty) == nil){
            showAlert(title: "Error!!", message: "Please select the product from table to proceed")
            return
        }
        if selectedQuantity >= Int(qty)! {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy/MM/dd HH:mm"
            let current = Date()
            
            let total = Double(totalLabel.text!)!
            let date = formatter.string(from: current)
            let history: History = History(n:name, q:Int(qty)!, t:total, d:date)
            historyManager.addNewHistory(newHistory: history)
            productManager.updateQuantity(name: name, quantity: Int(qty) ?? 0, isAdding: false)
            productTableView.reloadData();
            totalLabel.text = "Total"
            quantityLabel.text = "Quantity"
            nameLabel.text = "Name"
            selectedQuantity = 0
            selectedPrice = 0.0
            
            showAlert(title: "Success!!", message: "Updated the product")
        }else{
            showAlert(title: "Error!!", message: "Please select the product and check the available quantity")
        }
        tempQuantity = ""
    }
    
    @IBAction func numberClicked(_ sender: numberButton) {
        tempQuantity += sender.titleLabel?.text ?? "0"
        quantityLabel.text = tempQuantity
        totalLabel.text = "\(Double(tempQuantity)! * selectedPrice)"
        
   }
    
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productManager.getAllProducts().count
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! mainTableView
    
        cell.nameText?.text = productManager.getAllProducts()[indexPath.row].name;
        cell.quantityText?.text = "\(String(describing: productManager.getAllProducts()[indexPath.row].quantity))";
        cell.priceText?.text = "\(String(describing: productManager.getAllProducts()[indexPath.row].price))";
                
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedQuantity = productManager.getAllProducts()[indexPath.row].quantity
        selectedPrice = productManager.getAllProducts()[indexPath.row].price
        nameLabel?.text = productManager.getAllProducts()[indexPath.row].name
        quantityLabel?.text = "\(selectedQuantity)"
        totalLabel?.text = "\(selectedPrice * Double(selectedQuantity))"
        tempQuantity = ""
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        productTableView.rowHeight = 50
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let manager = segue.destination as! managerViewController
        manager.historyArr = historyManager.getAllHistory()
        manager.productsArr = productManager.getAllProducts()
        manager.productManager = productManager
    }
    
    override func viewWillAppear(_ animated: Bool) {
        productTableView.reloadData()
    }

}

