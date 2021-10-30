//
//  Product.swift
//  Assignment2
//
//  Created by user202299 on 10/25/21.
//

import Foundation

class Products {
    var name: String = "";
    var quantity: Int;
    var price: Double;
    
    init(n: String, q: Int, p: Double) {
        name = n;
        quantity = q;
        price = p;
    }
}
