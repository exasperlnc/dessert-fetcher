//
//  DessertView.swift
//  dessert-fetcher
//
//  Created by Logan Cole on 7/13/24.
//

import SwiftUI

struct DessertView: View {
    
    @StateObject var viewModel = DessertListViewModel()
    
    var body: some View {
        if viewModel.isLoading {
            ProgressView()
        } else {
            List {
                ForEach(viewModel.desserts, id: \.idMeal) { dessert in
                    DessertCell(dessert: dessert)
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
