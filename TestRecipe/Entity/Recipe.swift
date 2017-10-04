//
//  Recipe.swift
//  TestRecipe
//
//  Created by IOS Developer on 04.10.17.
//  Copyright © 2017 IOS Developer. All rights reserved.
//

import Foundation
import ObjectMapper

class Recipe: Mappable {
    
    
    
    var id : Int?
    
    var title : String?
    
    var image : String?
    
    var analyzedInstructions : [AnalyzedInstructions]?
    
    
    
    
    required init?(map: Map) {
        
    }
    
    init() {
        
    }
    
    func mapping(map: Map) {
        id                          <- map["id"]
        title                       <- map["title"]
        image                       <- map["image"]
        analyzedInstructions        <- map["analyzedInstructions"]
    }
    
    
}
