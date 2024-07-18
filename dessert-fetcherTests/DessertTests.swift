//
//  DessertTests.swift
//  dessert-fetcherTests
//
//  Created by Logan Cole on 7/15/24.
//

import XCTest
@testable import dessert_fetcher

class DessertTests: XCTestCase {

    func testDessertDecoding() throws {

        let json = """
        {
            "idMeal": "52768",
            "strMeal": "Apple Frangipan Tart",
            "strMealThumb": "https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg"
        }
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        do {
            let dessert = try decoder.decode(Dessert.self, from: json)
            
            XCTAssertEqual(dessert.idMeal, "52768", "Expected idMeal to be 52768")
            XCTAssertEqual(dessert.strMeal, "Apple Frangipan Tart", "Expected strMeal to be Apple Frangipan Tart")
            XCTAssertEqual(dessert.strMealThumb, "https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg", "Expected strMealThumb to match the URL")
        } catch {
            XCTFail("Decoding failed with error: \(error)")
        }
    }
}



