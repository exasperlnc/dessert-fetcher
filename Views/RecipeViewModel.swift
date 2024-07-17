//
//  RecipeViewModel.swift
//  dessert-fetcher
//
//  Created by Logan Cole on 7/16/24.
//

import Foundation

class RecipeViewModel: ObservableObject {
    
    @Published var recipe: Recipe? = nil
    
    private let recipeService: RecipeService
    
    init(recipeService: RecipeService = RecipeService()) {
        self.recipeService = recipeService
    }
    
    @MainActor
    func fetchRecipe(idMeal: String) async {
        
        if let fetchedRecipe = await recipeService.fetchRecipeDetail(id: idMeal) {
            recipe = fetchedRecipe
        }
    }
}
