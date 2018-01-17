//
//  RecipeView.swift
//  TestRecipe
//
//  Created by IOS Developer on 04.10.17.
//  Copyright © 2017 IOS Developer. All rights reserved.
//

import Foundation

protocol RecipeView {
    
    func setTitle(image: String, title: String, countSteps: Int)
    
    func disablePreviousButton()
    
    func setRecipeOnView(step: Step)
    
    func setNextButtonThanks()
    
    func setNextButtonNext()
    
    func dismissAction()
}
