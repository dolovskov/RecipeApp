//
//  StartViewController.swift
//  TestRecipe
//
//  Created by IOS Developer on 04.10.17.
//  Copyright © 2017 IOS Developer. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    var recipe : Recipe!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func getRecipeButtonClick(_ sender: Any) {
        self.activityIndicator.startAnimating()
        self.getRecipe()
    }
    
    func getRecipe() {
        ApiClient.shared.getRandomRecipe({  recipe in
            self.recipe = recipe
            self.activityIndicator.stopAnimating()
            self.performSegue(withIdentifier: "showRecipe", sender: self)
        }, { (sCode, localizedDescription) in
            self.showError(sCode: sCode, localizedDescription: localizedDescription)
            self.activityIndicator.stopAnimating()
        })
    }
    
    func showError(sCode: Int, localizedDescription: String) {
        let errorAlert=UIAlertController (title: "\(sCode)", message: localizedDescription, preferredStyle: .alert)
        let allertOkAction=UIAlertAction (title: "OK", style: .default, handler: nil)
        errorAlert.addAction(allertOkAction)
        self.present(errorAlert, animated: true, completion: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipe" {
             let destination = segue.destination as! UINavigationController
            let recipeVC = destination.topViewController as! RecipeViewController
            recipeVC.recipe = self.recipe
        }
    }
    
    @IBAction func unwindToStart(segue: UIStoryboardSegue) {
        
    }
    
    
}


