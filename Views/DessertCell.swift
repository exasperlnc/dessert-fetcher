//
//  DessertCell.swift
//  dessert-fetcher
//
//  Created by Logan Cole on 7/16/24.
//

import Foundation
import SwiftUI

struct DessertCell: View {
    let dessert: Dessert
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(dessert.strMeal)
                    .font(.title2)
                    .fontWeight(.medium)
            }
        }
    }
}

struct DessertCell_Previews: PreviewProvider {
    static var previews: some View {
        DessertCell(dessert: Dessert(idMeal: "1", strMeal: "Cheesecake", strMealThumb: "Fake"))
    }
}
