
//
//  RecipeView.swift
//  dessert-fetcher
//
//  Created by Logan Cole on 7/16/24.
//

import SwiftUI

struct RecipeView: View {
    @StateObject private var viewModel = RecipeViewModel()
    var dessert: Dessert

    var body: some View {
        NavigationView {
            ScrollView {
                if let recipe = viewModel.recipe {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Recipe for \(recipe.strMeal ?? "error")")
                            .font(.title)
                            .padding(.bottom, 10)
                        
                        Text("Instructions")
                            .font(.headline)
                        Text(recipe.strInstructions ?? "Error Loading Recipe Instructions")
                        
                        Text("Ingredients")
                            .font(.headline)
                            .padding(.top, 10)
                        
                        ForEach(recipe.ingredientsAndMeasurements(), id: \.0) { (ingredient, measurement) in
                            HStack {
                                Text(ingredient)
                                Spacer()
                                Text(measurement)
                            }
                            .padding(.vertical, 2)
                        }
                    }
                    .padding()
                } else {
                    ProgressView()
                }
            }
            .navigationTitle(dessert.strMeal)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Back") {}
                }
            }
            .task {
                await viewModel.fetchRecipe(idMeal: dessert.idMeal)
            }
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        let testDessert = Dessert(idMeal: "52893", strMeal: "Apple & Blackberry Crumble", strMealThumb: "")
        RecipeView(dessert: testDessert)
    }
}
