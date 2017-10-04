//
//  ResponceRecipe.swift
//  TestRecipe
//
//  Created by IOS Developer on 04.10.17.
//  Copyright © 2017 IOS Developer. All rights reserved.
//

import Foundation
import ObjectMapper

class ResponseRecipe: Mappable {
    
    
    
    var recipes : [Recipe]?
    
    
    required init?(map: Map) {
        
    }
    
    init() {
        
    }
    
    func mapping(map: Map) {
        recipes       <- map["recipes"]
    }
    
    
}
