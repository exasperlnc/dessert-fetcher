
//
//  RecipeView.swift
//  dessert-fetcher
//
//  Created by Logan Cole on 7/16/24.
//

//import SwiftUI
//
//struct RecipeView: View {
//    @StateObject private var viewModel = RecipeViewModel()
//    var dessert: Dessert
//
//    var body: some View {
//        NavigationView {
//            if let recipe = viewModel.recipe {
//                Text("Recipe for \(String(describing: recipe.strMeal))")
//                // Add more details and UI for the recipe here
//            } else {
//                ProgressView()
//            }
//        }
//        .task {
//            await viewModel.fetchRecipe(idMeal: dessert.idMeal)
//        }
//        .navigationTitle(dessert.strMeal)
//    }
//}
//
//struct RecipeView_Previews: PreviewProvider {
//    static var previews: some View {
//        let testDessert = Dessert(idMeal: "52893", strMeal: "Apple & Blackberry Crumble", strMealThumb: "")
//        RecipeView(dessert: testDessert)
//    }
//}
