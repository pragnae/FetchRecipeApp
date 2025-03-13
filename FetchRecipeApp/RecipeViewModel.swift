//
//  RecipeViewModel.swift
//  FetchRecipeApp
//
//  Created by Pragna Elavarthi on 3/13/25.


//  Handles fetching recipes from the API, updating the UI, and managing loading and error states.

import Foundation
@MainActor
class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func loadRecipes() async {
        isLoading = true
        errorMessage = nil
        do {
            let fetchedRecipes = try await RecipeService.shared.fetchRecipes()
            recipes = fetchedRecipes
        } catch {
            errorMessage = "Failed to load recipes: \(error.localizedDescription)"
            recipes = [] // Clear existing data if error occurs
        }
        isLoading = false
    }
}
