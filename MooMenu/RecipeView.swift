//
//  RecipeView.swift
//  MooMenu
//
//  Created by Gavin Cartier on 4/28/24.
//

import SwiftUI

struct RecipeView: View {
    
    let recipe: RecipeModel?
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                // Display the title of the recipe
                Text(recipe?.title ?? "Spaghetti Carbonara")
                    .font(.title)
                    .fontWeight(.bold)
                
                // Display the description of the recipe
                Text(recipe?.summary ?? "A classic Italian pasta dish made with eggs, cheese, bacon, and black pepper.")
                    .foregroundStyle(Color.gray)
                    .italic()
                
                // Attribute boxes
                Text("Dietary Considerations:")
                    .font(.title2)
                    .foregroundColor(.secondary)
                
                
                ScrollView(.horizontal) {
                    HStack {
                        if recipe?.isVegan ?? false {
                            AttributeBox(name: "Vegan", color:Color.green)
                        }
                        if recipe?.isVegetarian ?? false {
                            AttributeBox(name: "Vegetarian", color:Color.mint)
                        }
                        if recipe?.isDairyFree ?? false {
                            AttributeBox(name: "Dairy Free", color:Color.yellow)
                        }
                        if recipe?.isGlutenFree ?? false {
                            AttributeBox(name: "Gluten Free", color:Color.blue)
                        }
                        if recipe?.isNutFree ?? false {
                            AttributeBox(name: "Nut Free", color:Color.brown)
                        }
                        if recipe?.isEggFree ?? false {
                            AttributeBox(name: "Egg Free", color:Color.orange)
                        }
                    }
                    
                }
                
                // Time to finish the recipe text
                Text("Time to finish: \(recipe?.timeDone ?? "30") minutes")
                    .font(.system(size:18))
                    .foregroundColor(.secondary)
                    .italic()
                
                Text("Ingredients:")
                    .font(.title2)
                
                // Making the ingredients list
                
                ForEach(recipe?.ingredients ?? ["Spaghetti", "Eggs", "Parmesan Cheese", "Bacon", "Black Pepper"], id: \.self) { ingredient in
                    Text("- \(ingredient)")
                }
                
                Spacer()
                
                // Making the instructions
                Text("Instructions")
                    .font(.title2)
                    .fontWeight(.bold)
                
                
                ForEach(recipe?.instructions ?? [
                    "Cook spaghetti in salted boiling water until al dente.",
                    "Cook bacon in a skillet until crispy.",
                    "Mix eggs, cheese, and pepper in a bowl.",
                    "Combine cooked spaghetti with egg mixture.",
                    "Serve topped with crispy bacon and extra cheese."
                ], id: \.self) { instruction in
                    Text("\(instruction)")
                }
            }
        }
        .padding(.horizontal)
    }

}

// Little box to display the properties of the recipe
struct AttributeBox: View {
    let name: String
    let color: Color // Color of the box

    var body: some View {
        Text(name)
            .font(.subheadline)
            .foregroundColor(.white)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(color)
            .cornerRadius(8)
    }
}

#Preview {
    let recipe = RecipeModel(
        id: "1",
        images: ["image1.jpg", "image2.jpg"],
        title: "Spaghetti Carbonara",
        timeDone: "30",
        summary: "A classic Italian pasta dish made with eggs, cheese, bacon, and black pepper.",
        isVegan: false,
        isVegetarian: false,
        isDairyFree: false,
        isGlutenFree: false,
        isNutFree: true,
        isEggFree: false,
        ingredients: ["Spaghetti", "Eggs", "Parmesan Cheese", "Bacon", "Black Pepper"],
        instructions: [
            "Cook spaghetti in salted boiling water until al dente.",
            "Cook bacon in a skillet until crispy.",
            "Mix eggs, cheese, and pepper in a bowl.",
            "Combine cooked spaghetti with egg mixture.",
            "Serve topped with crispy bacon and extra cheese."
        ]
    )
    
    return RecipeView(recipe: recipe)
}
