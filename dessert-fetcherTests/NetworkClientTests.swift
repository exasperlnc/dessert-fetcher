//
//  NetworkClientTests.swift
//  dessert-fetcherTests
//
//  Created by Logan Cole on 7/15/24.
//

import Foundation

import XCTest
@testable import dessert_fetcher

class NetworkClientTests: XCTestCase {
    
    var networkClient: NetworkClient!

    override func setUpWithError() throws {
        
        networkClient = NetworkClient()
    }

    override func tearDownWithError() throws {
        
        networkClient = nil
    }

    func testPerformRequestFetchDesserts() async throws {
        
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert")!
        
        let expectation = self.expectation(description: "Completion handler invoked")

        let result = await networkClient.performRequest(url: url)
        
        switch result {
        case .success(let data):
            XCTAssertNotNil(data, "Expected non-nil data")
            do {
                let decoder = JSONDecoder()
                let dessertsResponse = try decoder.decode(DessertsResponse.self, from: data)
                XCTAssertFalse(dessertsResponse.meals.isEmpty, "Expected non-empty desserts list")
            } catch {
                XCTFail("Decoding error: \(error)")
            }
        case .failure(let error):
            XCTFail("Expected success, but got failure: \(error)")
        }
        expectation.fulfill()
        await fulfillment(of: [expectation])
    }

    func testPerformRequestFetchRecipeDetail() async throws {
        let sampleID = "52960"
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(sampleID)")!
        
        let expectation = self.expectation(description: "Completion handler invoked")

        let result = await networkClient.performRequest(url: url)
            switch result {
            case .success(let data):
                XCTAssertNotNil(data, "Expected non-nil data")
                do {
                    let decoder = JSONDecoder()
                    let recipeResponse = try decoder.decode(RecipeResponse.self, from: data)
                    XCTAssertEqual(recipeResponse.meals.first?.idMeal, sampleID, "Expected matching recipe ID")
                } catch {
                    XCTFail("Decoding error: \(error)")
                }
            case .failure(let error):
                XCTFail("Expected success, but got failure: \(error)")
            }
            expectation.fulfill()
        await fulfillment(of: [expectation])
    }
}
