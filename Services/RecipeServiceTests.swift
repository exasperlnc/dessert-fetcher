//
//  RecipeServiceTests.swift
//  dessert-fetcherTests
//
//  Created by Logan Cole on 7/13/24.
//

import XCTest
@testable import dessert_fetcher

class RecipeServiceTests: XCTestCase {
    var recipeService: RecipeService!
    
    override func setUpWithError() throws {
        recipeService = RecipeService()
    }
    
    override func tearDownWithError() throws {
        recipeService = nil
    }
    
    func testFetchDesserts() async throws {
        
        let desserts = await recipeService.fetchDesserts()
        
        XCTAssertNotNil(desserts)
        
        XCTAssertFalse(desserts.isEmpty, "Desserts array should not be empty")
    }
    
    func testFetchRecipeDetail() async throws {
        let sampleID = "52893"
        
        let sampleName = "Apple & Blackberry Crumble"
        
        let sampleInstructions = "Heat oven to 190C/170C fan/gas 5. Tip the flour and sugar into a large bowl. Add the butter, then rub into the flour using your fingertips to make a light breadcrumb texture. Do not overwork it or the crumble will become heavy. Sprinkle the mixture evenly over a baking sheet and bake for 15 mins or until lightly coloured.\r\nMeanwhile, for the compote, peel, core and cut the apples into 2cm dice. Put the butter and sugar in a medium saucepan and melt together over a medium heat. Cook for 3 mins until the mixture turns to a light caramel. Stir in the apples and cook for 3 mins. Add the blackberries and cinnamon, and cook for 3 mins more. Cover, remove from the heat, then leave for 2-3 mins to continue cooking in the warmth of the pan.\r\nTo serve, spoon the warm fruit into an ovenproof gratin dish, top with the crumble mix, then reheat in the oven for 5-10 mins. Serve with vanilla ice cream."
        
        let recipe = await recipeService.fetchRecipeDetail(id: sampleID)
        
//        switch result {
            
//            case .success(let recipe):
                
                XCTAssertNotNil(recipe)
                
        XCTAssertEqual(recipe?.idMeal, sampleID, "Recipe idMeal should match the sample ID")
                
        XCTAssertEqual(recipe?.strMeal, sampleName, "Recipe strMeal should match the sample Name")
                
        XCTAssertEqual(recipe?.strInstructions, sampleInstructions, "Recipe Instructions should match the sample Instructions")
                
//            case .failure(let error): 
//            XCTFail("Error fetching recipe details: \(error)")
//        }
    }
}
