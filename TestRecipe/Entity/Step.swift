//
//  Step.swift
//  TestRecipe
//
//  Created by IOS Developer on 04.10.17.
//  Copyright © 2017 IOS Developer. All rights reserved.
//

import Foundation
import ObjectMapper

class Step: Mappable {
    
    var number : Int?
    
    var step : String?
    
    required init?(map: Map) {
        
    }
    
    init() {
        
    }
    
    func mapping(map: Map) {
        number       <- map["number"]
        step         <- map["step"]
    }
    
    
}
