//
//  HeartButtonView.swift
//  StudyBarn
//
//  Created by Kunal Lohtia on 4/28/24.
//

import SwiftUI


struct HeartButtonView: View {
    let recipeId: String?
    
    @State private var heart = "heart"
    @EnvironmentObject var userViewModel: UserViewModel

    func toggleFavorite(heart: String) -> String {
        guard let recipeId = recipeId else {
            print("Error with toggle favorite..")
            return "heart"
        }
        // Remove Favorites from the user
        if userViewModel.checkFavorite(recipeId: recipeId) ?? false {
            userViewModel.removeUserFavorite( favorite: recipeId)
            return "heart"
        }
        // Add Favorites to the user
        else {
            userViewModel.addUserFavorite(favorite: recipeId)
            return "heart.fill"
        }
    }
    
    var body: some View {
        Button {
            heart = toggleFavorite(heart: heart)
        } label : {
            Image(systemName: heart)
                .font(.title2)
                .foregroundColor(Color.red.opacity(0.8))
        }
        .onAppear() {
            heart = userViewModel.checkFavorite(recipeId: recipeId ?? "") ?? false ? "heart.fill" : "heart"
        }
    }
}

#Preview {
    HeartButtonView(recipeId: "test")
        .environmentObject(UserViewModel())
}
