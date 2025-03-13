//
//  ContentView.swift
//  FetchRecipeApp
//
//  Created by Pragna Elavarthi on 3/13/25.
//


// Main view displaying a list of recipes, with loading, error handling, and pull-to-refresh support.

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = RecipeViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading recipes...")
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                } else {
                    List(viewModel.recipes) { recipe in
                        RecipeRow(recipe: recipe)
                    }
                    .refreshable {
                        await viewModel.loadRecipes()
                    }
                }
            }
            .task {
                await viewModel.loadRecipes()
            }
            .navigationTitle("Recipes")
        }
    }
}

struct RecipeRow: View {
    let recipe: Recipe

    var body: some View {
        HStack {
            CachedAsyncImage(url: recipe.photoURL)
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 8))

            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.headline)
                Text(recipe.cuisine)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}
