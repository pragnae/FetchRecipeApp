//
//  RecipeService.swift
//  FetchRecipeApp
//
//  Created by Pragna Elavarthi on 3/13/25.
//



// Handles fetching recipes from the API using async/await and decoding the response.

import Foundation

class RecipeService {
    static let shared = RecipeService()
    private let urlString = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
    
    func fetchRecipes() async throws -> [Recipe] {
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedResponse = try JSONDecoder().decode(RecipeResponse.self, from: data)
        
        return decodedResponse.recipes
    }
}
