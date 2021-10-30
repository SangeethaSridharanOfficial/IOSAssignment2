//
//  restockController.swift
//  Assignment2
//
//  Created by user202299 on 10/29/21.
//

import UIKit

class restockController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var productsArr  = [Products]()
    var productManager: ProductManager?
    var productSelected: String = ""

    @IBOutlet weak var productTableView: UITableView!
    @IBOutlet weak var restockQuantity: UITextField!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsArr.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "product", for: indexPath)
        cell.textLabel?.text = productsArr[indexPath.row].name
        cell.detailTextLabel?.text = "\(productsArr[indexPath.row].quantity)"
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        productSelected = productsArr[indexPath.row].name
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func restockBtn(_ sender: UIButton) {
        if restockQuantity.hasText {
            if productSelected.isEmpty {
                showAlert(title: "Error!!", message: "Please select the product");
            }else{
                productManager?.updateQuantity(name: productSelected, quantity: Int(restockQuantity.text ?? "0")!, isAdding: true)
                productTableView.reloadData()
                restockQuantity.text = ""
                showAlert(title: "Success!!", message: "Product Restocked")
            }
        }else{
            showAlert(title: "Error!!", message: "Please enter the quantity");
        }
    }
    
    @IBAction func cancelBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}
