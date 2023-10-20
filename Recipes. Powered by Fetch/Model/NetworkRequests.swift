//
//  NetworkRequest.swift
//  Recipes. Powered by Fetch
//
//  Created by Tevin Jones on 10/15/23.
//

import Foundation

protocol NetworkRequestsDelegate {
    
    func didFailWithError(error: Error)
    func didPopulateArray(desserts:[Meals])
    func didFetchIDinfo(recipes: [MealInfo])
}


struct NetworkRequests {
    
    let dessertsurl = "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    let idurl = "https://www.themealdb.com/api/json/v1/1/lookup.php?i="
    var delegate: NetworkRequestsDelegate?
    var mealsPH: [Meals]?
    var recipeInfo: [MealInfo]?
    
    func performRequest(with urlString: String) {
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    print (error?.localizedDescription ?? "Something went wrong with your session task")
                    return
                }
                if let safeData = data {
                    
                    if urlString == dessertsurl{
                        let dessertArray = self.parseDessertCategoryJSON(safeData)
                        self.delegate?.didPopulateArray(desserts: dessertArray)
                    }
                    if urlString.contains("lookup"){
                        let infoArray = self.parseMealByIDJSON(safeData)
                        self.delegate?.didFetchIDinfo(recipes: infoArray)
                    }
                    }
            }
            task.resume()
        }
    }
    
    func parseDessertCategoryJSON(_ rawSafeData: Data) -> [Meals] {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(DessertApiModel.self, from: rawSafeData)
            let mealsArray = decodedData.meals
            
            return mealsArray
        } catch {
            delegate?.didFailWithError(error: error)
            return []
        }
    }
    
    func parseMealByIDJSON(_ rawSafeData: Data) -> [MealInfo] {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(DishIDApiModel.self, from: rawSafeData)
            let infoArray = decodedData.meals
            
            return infoArray
        } catch {
            delegate?.didFailWithError(error: error)
            return []
        }
    }
}
