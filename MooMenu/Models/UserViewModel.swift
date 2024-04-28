//
//  UserViewModel.swift
//  MooMenu
//
//  Created by Ann Yip on 4/27/24.
//

import Foundation
import FirebaseFirestore

@MainActor
final class UserViewModel: ObservableObject {
    @Published private(set) var user: UserModel? = nil
    
    // Load Authenticated User from the Database
    func loadUser() async throws {
        let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
        self.user = try await UserManager.shared.getUser(userId: authDataResult.uid)
    }
    
    // Add favorite recipe to the database
    func addUserFavorite(favorite: String) {
        guard let user else { return }
        
        Task {
            try await UserManager.shared.addUserFavorite(userId:user.userId, favorite: favorite)
            self.user = try await UserManager.shared.getUser(userId: user.userId)
        }
    }
    
    // remove user favorite recipe from database
    func removeUserFavorite(favorite: String) {
        guard let user else { return }
        
        Task {
            try await UserManager.shared.removeUserFavorite(userId:user.userId, favorite: favorite)
            self.user = try await UserManager.shared.getUser(userId: user.userId)
        }
    }
    
    // Check if recipe in user's favorites
    func checkFavorite(recipeId: String) -> Bool? {
        if let user = user {
            return user.favorites.contains(recipeId)
        }
        return nil
    }
    
    // Get All Favorite recipes by user
    func getAllFavoriteRecipes() async throws -> [RecipeModel]{
        let recipes = try await RecipeManager.shared.getAllFavoriteRecipes(recipeIds: user?.favorites ?? [])
        return recipes
    }
}
