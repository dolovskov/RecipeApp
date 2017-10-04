//
//  CircleImageView.swift
//  TestRecipe
//
//  Created by IOS Developer on 04.10.17.
//  Copyright © 2017 IOS Developer. All rights reserved.
//

import UIKit

@IBDesignable
class CircleImageView: UIImageView {
    
    @IBInspectable var isCircle : Bool = true {
        didSet {
            if isCircle {
                self.layer.cornerRadius = self.frame.height / 2
                self.clipsToBounds = true
            }
            else {
                self.layer.cornerRadius = 0
            }
        }
    }

}
