//
//  ApiClient.swift
//  TestRecipe
//
//  Created by IOS Developer on 04.10.17.
//  Copyright © 2017 IOS Developer. All rights reserved.
//

import Foundation
import Alamofire

class ApiClient {
    
    static let shared = ApiClient()
    
    var alamofireManager : Alamofire.SessionManager!
    
    init() {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["X-Mashape-Key":"KuSzJ9SN2wmsh5AQWMx6Se4isNIAp1YEvZMjsnEei2KiJZcZTe", "X-Mashape-Host":"spoonacular-recipe-food-nutrition-v1.p.mashape.com"]
        alamofireManager = Alamofire.SessionManager(configuration: configuration)
    }
    
    
    func getRandomRecipe(_ onCompletion: @escaping (Recipe) -> Void, _ onError: @escaping (Int, String) -> Void) {
        
        
        alamofireManager.request("https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/random", method: .get).validate().responseString {
            (response) in
            if response.result.isSuccess {
                let recipesResponse = ResponseRecipe(JSONString: response.result.value ?? "")
                onCompletion(recipesResponse?.recipes?.first ?? Recipe())
            } else {
                let sCode = response.response?.statusCode ?? 0
                let localizedDescription = response.error?.localizedDescription ?? ""
                onError(sCode, localizedDescription)
            }
        }
    }
}
