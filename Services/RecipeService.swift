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
//            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return []
        }
        
        let result = await networkClient.performRequest(url: url)
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let dessertsResponse = try decoder.decode(DessertsResponse.self, from: data)
//                    completion(.success(dessertsResponse.meals))
                    return dessertsResponse.meals
                } catch {
//                    completion(.failure(error))
                    return []
                }
            case .failure(_):
//                completion(.failure(error))
                return []
            }
    }
    
    enum RecipeError: Error {
        case invalidURL
        case noRecipeFound
        case decodingError
        case networkError(Error)
    }

    func fetchRecipeDetail(id: String) async -> Result<Recipe, RecipeError> {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)") else {
//            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return .failure(.invalidURL)
        }
        
        let result = await networkClient.performRequest(url: url)
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let recipeResponse = try decoder.decode(RecipeResponse.self, from: data)
                    if let recipe = recipeResponse.meals.first {
//                        completion(.success(recipe))
                        return .success(recipe)
                    } else {
//                        completion(.failure(NSError(domain: "No recipe found", code: 0, userInfo: nil)))
                        return .failure(.noRecipeFound)
                    }
                } catch {
//                    completion(.failure(error))
                    return .failure(.decodingError)
                }
            case .failure(let error):
//                completion(.failure(error))
                return .failure(.networkError(error))
            }
    }
}
