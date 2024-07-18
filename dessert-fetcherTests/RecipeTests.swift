//
//  RecipeTests.swift
//  dessert-fetcherTests
//
//  Created by Logan Cole on 7/15/24.
//

import XCTest
@testable import dessert_fetcher

class RecipeTests: XCTestCase {

    func testRecipeDecoding() throws {
        let json = """
        {
            "idMeal": "52772",
            "strMeal": "Teriyaki Chicken Casserole",
            "strInstructions": "Preheat oven to 350 degrees F. Spray a 9x13-inch baking dish with non-stick spray....",
            "strIngredient1": "soy sauce",
            "strIngredient2": "water",
            "strIngredient3": "brown sugar",
            "strIngredient4": "ground ginger",
            "strIngredient5": "minced garlic"
        }
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        do {
            let recipe = try decoder.decode(Recipe.self, from: json)
            
            XCTAssertEqual(recipe.idMeal, "52772", "Expected idMeal to be 52772")
            XCTAssertEqual(recipe.strMeal, "Teriyaki Chicken Casserole", "Expected strMeal to be Teriyaki Chicken Casserole")
            XCTAssertEqual(recipe.strInstructions, "Preheat oven to 350 degrees F. Spray a 9x13-inch baking dish with non-stick spray....", "Expected strInstructions to match the given instructions")
            XCTAssertEqual(recipe.strIngredient1, "soy sauce", "Expected strIngredient1 to be soy sauce")
            XCTAssertEqual(recipe.strIngredient2, "water", "Expected strIngredient2 to be water")
            XCTAssertEqual(recipe.strIngredient3, "brown sugar", "Expected strIngredient3 to be brown sugar")
            XCTAssertEqual(recipe.strIngredient4, "ground ginger", "Expected strIngredient4 to be ground ginger")
            XCTAssertEqual(recipe.strIngredient5, "minced garlic", "Expected strIngredient5 to be minced garlic")
        } catch {
            XCTFail("Decoding failed with error: \(error)")
        }
    }
}
