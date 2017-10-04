//
//  AnalyzedInstructions.swift
//  TestRecipe
//
//  Created by IOS Developer on 04.10.17.
//  Copyright © 2017 IOS Developer. All rights reserved.
//

import Foundation
import ObjectMapper

class AnalyzedInstructions: Mappable {
    
    
    var steps : [Step]?
    
    required init?(map: Map) {
        
    }
    
    init() {
        
    }
    
    func mapping(map: Map) {
        steps       <- map["steps"]
    }
    
    
}
