//
//  ContentView.swift
//  dessert-fetcher
//
//  Created by Logan Cole on 7/13/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = DessertListViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.desserts, id: \.idMeal) { dessert in
                Text(dessert.strMeal)
            }
        }
        .padding()
        .task {
            await viewModel.fetchDesserts()
        }
    }
}

#Preview {
    ContentView()
}
