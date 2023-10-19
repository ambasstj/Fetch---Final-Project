//
//  RecipeCard.swift
//  Recipes. Powered by Fetch
//
//  Created by Tevin Jones on 10/16/23.
//

import Foundation
import UIKit
import Kingfisher
import WebKit

class RecipeCardController: UIViewController{
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var measurementLabel1: UILabel!
    @IBOutlet weak var measurementLabel2: UILabel!
    @IBOutlet weak var measurementLabel3: UILabel!
    @IBOutlet weak var measurementLabel4: UILabel!
    @IBOutlet weak var measurementLabel5: UILabel!
    @IBOutlet weak var measurementLabel6: UILabel!
    @IBOutlet weak var measurementLabel7: UILabel!
    @IBOutlet weak var measurementLabel8: UILabel!
    @IBOutlet weak var measurementLabel9: UILabel!
    @IBOutlet weak var measurementLabel10: UILabel!
    @IBOutlet weak var measurementLabel11: UILabel!
    @IBOutlet weak var measurementLabel12: UILabel!
    @IBOutlet weak var ingredientLabel1: UILabel!
    @IBOutlet weak var ingredientLabel2: UILabel!
    @IBOutlet weak var ingredientLabel3: UILabel!
    @IBOutlet weak var ingredientLabel4: UILabel!
    @IBOutlet weak var ingredientLabel5: UILabel!
    @IBOutlet weak var ingredientLabel6: UILabel!
    @IBOutlet weak var ingredientLabel7: UILabel!
    @IBOutlet weak var ingredientLabel8: UILabel!
    @IBOutlet weak var ingredientLabel9: UILabel!
    @IBOutlet weak var ingredientLabel10: UILabel!
    @IBOutlet weak var ingredientLabel11: UILabel!
    @IBOutlet weak var ingredientLabel12: UILabel!
    
    var recipeCache: MealInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoView.isHidden = true
        nameLabel.text = recipeCache?.strMeal
        imageView.kf.setImage(with: recipeCache?.strMealThumb)
    }
    
    func refreshUI() {
        DispatchQueue.main.async {
            self.videoView.isHidden = true
            self.nameLabel.text = self.recipeCache?.strMeal
            self.imageView.kf.setImage(
                with: self.recipeCache?.strMealThumb)
            
            self.instructionsLabel.text = self.recipeCache?.strInstructions
            
            self.measurementLabel1.text = self.recipeCache?.strMeasure1
            self.ingredientLabel1.text = self.recipeCache?.strIngredient1
            
            self.measurementLabel2.text = self.recipeCache?.strMeasure2
            self.ingredientLabel2.text = self.recipeCache?.strIngredient2
            
            self.measurementLabel3.text = self.recipeCache?.strMeasure3
            self.ingredientLabel3.text = self.recipeCache?.strIngredient3
            
            self.measurementLabel4.text = self.recipeCache?.strMeasure4
            self.ingredientLabel4.text = self.recipeCache?.strIngredient4
            
            self.measurementLabel5.text = self.recipeCache?.strMeasure5
            self.ingredientLabel5.text = self.recipeCache?.strIngredient5
            
            self.measurementLabel6.text = self.recipeCache?.strMeasure6
            self.ingredientLabel6.text = self.recipeCache?.strIngredient6
            
            self.ingredientLabel7.text = self.recipeCache?.strIngredient7
            self.measurementLabel7.text = self.recipeCache?.strMeasure7
            
            self.measurementLabel8.text = self.recipeCache?.strMeasure8
            self.ingredientLabel8.text = self.recipeCache?.strIngredient8
            
            self.measurementLabel9.text = self.recipeCache?.strMeasure9
            self.ingredientLabel9.text = self.recipeCache?.strIngredient9
            
            self.measurementLabel10.text = self.recipeCache?.strMeasure10
            self.ingredientLabel10.text = self.recipeCache?.strIngredient10
            
            self.measurementLabel11.text = self.recipeCache?.strMeasure11
            self.ingredientLabel11.text = self.recipeCache?.strIngredient11
            
            self.measurementLabel12.text = self.recipeCache?.strMeasure12
            self.ingredientLabel12.text = self.recipeCache?.strIngredient12
        }
    }
    
    @IBAction func playButton(_ sender: Any) {
        videoView.isHidden = false
        
        let request = URLRequest(url: (recipeCache?.strYoutube ?? URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ"))!)
        webView.load(request)
    }
}
