//
//  RecipePresenter.swift
//  TestRecipe
//
//  Created by IOS Developer on 04.10.17.
//  Copyright © 2017 IOS Developer. All rights reserved.
//

import Foundation

class RecipePresenter {
    
    let view : RecipeView
    
    let recipe: Recipe
    
    var steps : [Step]!
    
    var activeStep = 0
    
    required init(view: RecipeView) {
        self.view = view
        self.recipe = Recipe()
    }
    
    init (withRecipe recipe: Recipe, view: RecipeView) {
        self.view = view
        self.recipe = recipe
        self.steps = recipe.analyzedInstructions?.first?.steps ?? [Step]()
        self.showFirstRecipe()
    }
    
    func showFirstRecipe() {
        let image = recipe.image ?? ""
        let title = recipe.title ?? ""
        view.setTitle(image: image, title: title, countSteps: steps.count)
        view.disablePreviousButton()
        if steps.count == 1 {
            self.view.setNextButtonThanks()
        }
        self.setStepOnView()
    }
    
    func setStepOnView() {
        if activeStep == 0 {
            view.disablePreviousButton()
        } else if activeStep == steps.count - 1 {
            view.setNextButtonThanks()
        }
        view.setRecipeOnView(step: steps[activeStep])
    }
    
    func nextButtonClick() {
        if activeStep == steps.count - 1 {
            view.close()
        } else {
            activeStep += 1
            setStepOnView()
        }
    }
    
    func previousButtonClick() {
        if activeStep == steps.count - 1 {
            view.setNextButtonNext()
        }
        activeStep -= 1
        setStepOnView()
    }
    
}
