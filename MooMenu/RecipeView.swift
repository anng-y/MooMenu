//
//  RecipeView.swift
//  MooMenu
//
//  Created by Gavin Cartier on 4/28/24.
//

import SwiftUI

struct RecipeView: View {
    let recipe: Recipe
    @State var index: Int
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Display the image of the recipe
                Image(recipe.rec_image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height:300)
                    .cornerRadius(10)
                    .padding()
                
                // Display the title of the recipe
                Text(recipe.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
            }
        }
    }
}

#Preview {
    RecipeView(recipe: Recipe(
        instructionsDict: [1: "Step 1", 2: "Step 2", 3: "Step 3"],
        title: "Default Recipe",
        nutrientsDict: ["calories": "200", "protein": "10g", "fat": "5g"],
        ingredients: ["Ingredient 1", "Ingredient 2", "Ingredient 3"],
        rec_image: "spaghet.png",
        id: 1,
        summary: "This is a default recipe example."
    ), index: 0)
}
