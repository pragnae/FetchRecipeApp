//
//  RecipeServiceTests.swift
//  FetchRecipeAppTests
//
//  Created by Pragna Elavarthi on 3/13/25.
//

// Unit tests for RecipeService to verify recipe fetching from the API.

import XCTest
@testable import FetchRecipeApp

final class RecipeServiceTests: XCTestCase {
    func testFetchRecipes() async throws {
        let recipes = try await RecipeService.shared.fetchRecipes()
        XCTAssertFalse(recipes.isEmpty, "Recipes list should not be empty")
    }
}
