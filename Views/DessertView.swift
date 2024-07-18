//
//  DessertView.swift
//  dessert-fetcher
//
//  Created by Logan Cole on 7/13/24.
//

import Foundation
import SwiftUI

struct DessertView: View {
    
    @StateObject var viewModel = DessertListViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.desserts, id: \.idMeal) { dessert in
                    NavigationLink(destination: RecipeView(dessert: dessert)) {
                        DessertCell(dessert: dessert)
                    }
                }
            }
            .padding()
            .task {
                await viewModel.fetchDesserts()
            }
        }
    }
}

#Preview {
    DessertView()
}
