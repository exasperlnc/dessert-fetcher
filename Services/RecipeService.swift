//
//  RecipeService.swift
//  dessert-fetcher
//
//  Created by Logan Cole on 7/13/24.
//

import Foundation

class RecipeService {

    private let networkClient = NetworkClient()

    func fetchDesserts() async -> [Dessert] {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            return []
        }
        
        let result = await networkClient.performRequest(url: url)
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let dessertsResponse = try decoder.decode(DessertsResponse.self, from: data)
                    return dessertsResponse.meals
                } catch {
                    return []
                }
            case .failure(_):
                return []
            }
    }
    
    enum RecipeError: Error {
        case invalidURL
        case noRecipeFound
        case decodingError
        case networkError(Error)
    }

    func fetchRecipeDetail(id: String) async -> Recipe? {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)") else {
            return nil
        }
        
        let result = await networkClient.performRequest(url: url)
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let recipeResponse = try decoder.decode(RecipeResponse.self, from: data)
                    if let recipe = recipeResponse.meals.first {
                        return recipe
                    } else {
                        return nil
                    }
                } catch {
                    return nil
                }
            case .failure(_):
                return nil
            }
    }
}
