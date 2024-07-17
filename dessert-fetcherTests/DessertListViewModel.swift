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
//        isLoading = true
//        errorMessage = nil
        
        desserts = await recipeService.fetchDesserts()
        
//        isLoading = false
    }
}
