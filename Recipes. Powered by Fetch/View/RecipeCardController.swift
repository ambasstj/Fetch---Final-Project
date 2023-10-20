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

class RecipeCardController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    @IBOutlet weak var instructionsLabel: UILabel!
    
    var recipeCache: MealInfo?
    var validIngredientPH: [String]?
    var validMeasurementPH: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        videoView.isHidden = true
        nameLabel.text = recipeCache?.strMeal
        imageView.kf.setImage(with: recipeCache?.strMealThumb)
        tableViewOutlet.register(UINib(
            nibName: "CustomTableViewCell",
            bundle: nil),
                                 forCellReuseIdentifier: "ReusableIngredientCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        let mirror = Mirror(reflecting: recipeCache ?? "")
        var validIngredients = [String]()
        var validMeasurements = [String]()
        
        for case let (label?, value) in mirror.children {
            if let measurePropertyName = label as? String,
               let measurePropertyValue = value as? String,
               !measurePropertyValue.isEmpty,
               measurePropertyName.contains("Measure")
            {
               validMeasurements.append(value as? String ?? "")
            }
        }
        for case let (label?, value) in mirror.children {
            if let ingredientPropertyName = label as? String,
               let ingredientPropertyValue = value as? String,
               !ingredientPropertyValue.isEmpty,
               ingredientPropertyName.contains("Ingredient")
            {
               validIngredients.append(value as? String ?? "")
            }
        }
        
        validMeasurementPH = validMeasurements
        validIngredientPH = validIngredients
        
        return validIngredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableIngredientCell", for: indexPath) as! CustomTableViewCell
        
        cell.ingredientLabel.text = validIngredientPH?[indexPath.row]
        cell.measurementLabel.text = validMeasurementPH?[indexPath.row]
        
    
        return cell
    }
    
    
    func refreshUI() {
        DispatchQueue.main.async {
            self.videoView.isHidden = true
            self.nameLabel.text = self.recipeCache?.strMeal
            self.imageView.kf.setImage(
                with: self.recipeCache?.strMealThumb)
            
            self.instructionsLabel.text = self.recipeCache?.strInstructions
            self.tableViewOutlet.reloadData()
        }
    }
    
    @IBAction func playButton(_ sender: Any) {
        videoView.isHidden = false
        
        let request = URLRequest(url: (recipeCache?.strYoutube ?? URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ"))!)
        webView.load(request)
    }
}
