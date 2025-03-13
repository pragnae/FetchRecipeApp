//
//  Recipe.swift
//  FetchRecipeApp
//
//  Created by Pragna Elavarthi on 3/13/25.
//

// Model representing a single recipe, including its name, cuisine type, and optional image URL.

import Foundation

struct Recipe: Codable, Identifiable {
    let id: String
    let name: String
    let cuisine: String
    let photoURL: URL?

    enum CodingKeys: String, CodingKey {
        case id = "uuid"
        case name
        case cuisine
        case photoURL = "photo_url_small"
    }
}

struct RecipeResponse: Codable {
    let recipes: [Recipe]
}
