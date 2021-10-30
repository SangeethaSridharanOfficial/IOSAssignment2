//
//  ProductManager.swift
//  Assignment2
//
//  Created by user202299 on 10/25/21.
//

import Foundation

class ProductManager {
    var products = [Products]()
    
    init() {
        products.append(Products(n: "Pants", q: 20, p:10))
        products.append(Products(n: "Shoes", q: 50, p: 20.3))
        products.append(Products(n: "Hats", q: 10, p: 15))
        products.append(Products(n: "Tshirts", q: 10, p: 10))
        products.append(Products(n: "Dresses", q: 24, p: 14))
    }
    
    func addNewProduct(newProduct: Products){
        products.append(newProduct)
    }
    
    func getAllProducts() -> [Products]{
        return products;
    }
    
    func updateQuantity(name: String, quantity: Int, isAdding: Bool){
        for product in products {
            if product.name.compare(name, options: .caseInsensitive) == .orderedSame {
                if isAdding {
                    product.quantity += quantity;
                }else {
                    product.quantity -= quantity;
                }
            }
        }
    }
}
