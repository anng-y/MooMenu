//
//  PostRecipeViewModel.swift
//  MooMenu
//
//  Created by Ann Yip on 4/28/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

@MainActor
final class PostViewModel: ObservableObject {
    
    func addNewRecipe(title: String, summary: String, timeDone: Int, isVegan: Bool, isVegetarian: Bool,  isDairyFree: Bool, isGlutenFree: Bool, isNutFree: Bool, isEggFree: Bool,ingredients: [String], instructions: [String]) async throws {
        // Initialize area values
        let recipeId = RecipeManager.shared.getDocumentId()
        let images: [String]? = []
        
        // Convert to Double Values
        let recipe = RecipeModel(id: recipeId, images: images, title: title, timeDone: timeDone, summary: summary, isVegan: isVegan, isVegetarian: isVegetarian,  isDairyFree: isDairyFree, isGlutenFree: isGlutenFree, isNutFree: isNutFree, isEggFree: isEggFree, ingredients: ingredients, instructions: instructions)
        
        try await RecipeManager.shared.createNewRecipe(recipe: recipe)
    }
}
