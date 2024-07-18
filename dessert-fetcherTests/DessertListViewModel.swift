//
//  DessertListViewModel.swift
//  dessert-fetcher
//
//  Created by Logan Cole on 7/15/24.
//

import Foundation

class DessertListViewModel: ObservableObject {
    
    @Published var desserts: [Dessert] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private let recipeService: RecipeService
    
    init(recipeService: RecipeService = RecipeService()) {
        self.recipeService = recipeService
    }
    @MainActor
    func fetchDesserts() async {
        
        let fetchedDesserts = await recipeService.fetchDesserts()
        desserts = fetchedDesserts.sorted(by: { $0.strMeal < $1.strMeal })
    }
}
