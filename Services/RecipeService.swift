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
            case .failure(let error):
//                completion(.failure(error))
                return []
            }
    }

    func fetchRecipeDetail(id: String, completion: @escaping (Result<Recipe, Error>) -> Void) async {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        let result = await networkClient.performRequest(url: url)
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let recipeResponse = try decoder.decode(RecipeResponse.self, from: data)
                    if let recipe = recipeResponse.meals.first {
                        completion(.success(recipe))
                    } else {
                        completion(.failure(NSError(domain: "No recipe found", code: 0, userInfo: nil)))
                    }
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
    }
}
