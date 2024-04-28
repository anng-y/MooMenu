//
//  SelectViewModel.swift
//  MooMenu
//
//  Created by Ann Yip on 4/28/24.
//

import Foundation

@MainActor
final class SelectViewModel: ObservableObject {
    @Published var RecipeIds: [String] = []
    
    func loadRecipes(recipes: [RecipeModel]) async throws {
        let recipes = try await RecipeManager.shared.getAllRecipes()
        for recipe in recipes {
            RecipeIds.append(recipe.id)
        }
    }
    
}
