//
//  History.swift
//  Assignment2
//
//  Created by user202299 on 10/27/21.
//

import Foundation

class History {
    var name: String = "";
    var quantity: Int;
    var total: Double;
    var date: String
    
    init(n: String, q: Int, t: Double, d: String) {
        name = n;
        quantity = q;
        total = t;
        date = d;
    }
}
