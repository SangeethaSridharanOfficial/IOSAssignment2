//
//  numberButton.swift
//  Assignment2
//
//  Created by user202299 on 10/23/21.
//

import UIKit

class numberButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layer.backgroundColor = UIColor.white.cgColor
        layer.cornerRadius = layer.frame.width / 2
    }
}
