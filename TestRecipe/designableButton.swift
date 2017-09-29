//
//  designableButton.swift
//  TestRecipe
//
//  Created by IOS Developer on 29.09.17.
//  Copyright © 2017 IOS Developer. All rights reserved.
//

import UIKit

@IBDesignable
class designableButton: UIButton {

    @IBInspectable var borderWidth : CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor : UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
