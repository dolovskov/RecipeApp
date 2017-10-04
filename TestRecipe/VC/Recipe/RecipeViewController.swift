//
//  RecipeViewController.swift
//  TestRecipe
//
//  Created by IOS Developer on 04.10.17.
//  Copyright © 2017 IOS Developer. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController, RecipeView {
    
    var presenter : RecipePresenter!
    
    var recipe : Recipe!
    
    var countSteps : Int!
    
    @IBOutlet var imageView: CircleImageView!
    
    @IBOutlet var nameRecipeLabel: UILabel!
    @IBOutlet var currentStepLabel: UILabel!
    @IBOutlet var allStepLabel: UILabel!
    
    @IBOutlet var recipeTextView: UITextView!
    
    @IBOutlet var previousStepButton: DesignableButton!
    @IBOutlet var nextStepButton: DesignableButton!
    @IBOutlet var barProgress: UIProgressView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingView()
        initPresenter()
    }
    
    func settingView() {
        previousStepButton.setTitleColor(UIColor.lightGray, for: .disabled)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        nameRecipeLabel.adjustsFontSizeToFitWidth=true
    }
    
    func initPresenter() {
        self.presenter = RecipePresenter(withRecipe: self.recipe, view: self)
    }
    
    
    func setTitle(image: String, title: String, countSteps: Int) {
        self.nameRecipeLabel.text = title
        self.countSteps = countSteps
        self.allStepLabel.text = "out of \(countSteps)"
        getImage(byUrl: image, {
            image in
            self.imageView.image = image
        })
    }
    
    func disablePreviousButton() {
        previousStepButton.isEnabled = false
    }
    
    
    func setNextButtonThanks() {
        nextStepButton.setTitle("Thanks", for: .normal)
    }
    func setNextButtonNext() {
        nextStepButton.setTitle("Next step", for: .normal)
    }
    
    func setRecipeOnView(step: Step) {
        currentStepLabel.text = "Step \(step.number ?? 0)"
        recipeTextView.text = step.step
        let stepNum = Float(step.number ?? 0)
        let countStepsNum = Float(countSteps)
        barProgress.progress = stepNum / countStepsNum
    }
    
    
    @IBAction func previousButtonClick(_ sender: Any) {
            presenter.previousButtonClick()
    }
    
    @IBAction func nextButtonClick(_ sender: Any) {
        if previousStepButton.isEnabled == false {
             previousStepButton.isEnabled = true
        }
        presenter.nextButtonClick()
    }
    
    func close() {
        self.performSegue(withIdentifier: "closeView", sender: self)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

