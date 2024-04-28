//
//  RecipeManager.swift
//  MooMenu
//
//  Created by Ann Yip on 4/28/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class RecipeManager {
    
    static let shared = RecipeManager()
    private init() {}
    
    private let recipeCollection = Firestore.firestore().collection("recipes")
    
    private func recipeDocument(recipeId: String) -> DocumentReference {
        return recipeCollection.document(recipeId)
    }
    
    func getDocumentId() -> String {
        return recipeCollection.document().documentID
    }
    
    func createNewRecipe(recipe: RecipeModel) async throws {
        try recipeDocument(recipeId: recipe.id).setData(from: recipe, merge: false)
    }
    
    func getRecipe(recipeId: String) async throws -> RecipeModel? {
        let document = try? await recipeDocument(recipeId: recipeId).getDocument()
        
        // Convert data to RecipeModel format
        if document?.exists ?? false {
            return try document?.data(as: RecipeModel.self)
        }
        
        return nil
    }
    
    func getAllRecipes() async throws -> [RecipeModel] {
        let snapshot = try await recipeCollection.order(by: "timeDone", descending: false).getDocuments()
        
        var recipes: [RecipeModel] = []
        
        // Convert data into AreaModel type
        for document in snapshot.documents {
            let recipe = try document.data(as: RecipeModel.self)
            recipes.append(recipe)
        }
        
        return recipes
    }
    
    func addReicpeImage(recipeId: String, name: String) async throws {
        let data: [String: Any] = [
            "images": FieldValue.arrayUnion([name])
        ]
        
        try await recipeDocument(recipeId: recipeId).updateData(data)
    }
    
}
    
