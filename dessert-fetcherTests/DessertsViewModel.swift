//
//  DessertsViewModel.swift
//  dessert-fetcher
//
//  Created by Logan Cole on 7/15/24.
//

import Foundation

final class DessertsViewModel: ObservableObject {
    
    @Published var desserts: [Dessert] = []
    @Published var isLoading = false
    
    let recipeService = RecipeService()
    
    func getDesserts() {
        isLoading = true
        
        recipeService.fetchDesserts { [self] result in
            DispatchQueue.main.async {
                self.isLoading = false
                
                switch result {
                case .success(let desserts):
                    self.desserts = 
                }
            }
        }
    }
}
