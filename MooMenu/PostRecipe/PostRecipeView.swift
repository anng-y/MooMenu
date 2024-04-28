//
//  PostRecipeView.swift
//  MooMenu
//
//  Created by Ann Yip on 4/28/24.
//

import SwiftUI
import Combine

struct PostRecipeView: View {
    
    @StateObject var postRecipeViewModel = PostRecipeViewModel()
    
    @State var title = ""
    @State var timeDone = ""
    @State var summary = ""
    @State var isVegan = false
    @State var isVegetarian = false
    @State var isDairyFree = false
    @State var isGlutenFree = false
    @State var isNutFree = false
    @State var isEggFree = false
    @State var ingredients = [String]()
    @State var instructions = [String]()
    
    @State var error = false;
    
    private func checkInputs() {
        if title.isEmpty {
            error = true
            return
        }
        if summary.isEmpty {
            error = true
            return
        }
        if timeDone.isEmpty {
            error = true
            return
        }
        if ingredients.isEmpty {
            error = true
            return
        }
        if instructions.isEmpty {
            error = true
            return
        }
        error = false
    }
    
    private func addRecipe() {
        Task {
            try await postRecipeViewModel.addNewRecipe(title: title, summary: summary, timeDone: timeDone, isVegan: isVegan, isVegetarian: isVegetarian, isDairyFree: isDairyFree, isGlutenFree: isGlutenFree, isNutFree: isNutFree, isEggFree: isEggFree, ingredients: ingredients, instructions: instructions)
        }
    }
        
    func getBindingIngredients(forIndex index: Int) -> Binding<String> {
        return Binding<String>(get: { ingredients[index] },
                               set: { ingredients[index] = $0 })
    }
    
    func getBindingInstructions(forIndex index: Int) -> Binding<String> {
        return Binding<String>(get: { instructions[index] },
                               set: { instructions[index] = $0 })
    }
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Title")) {
                    TextField("Recipe Title", text: $title)
                }
                Section(header: Text("Time until Done in minutes")) {
                    TextField("Enter how long in minutes it will take", text: $timeDone)
                        .keyboardType(.numberPad)
                        .onReceive(Just(timeDone)) { newValue in
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            if filtered != newValue {
                                self.timeDone = filtered
                            }
                        }
                }
                Section(header: Text("Recipe summary")) {
                    TextField("Summary", text: $summary)
                        .lineLimit(5, reservesSpace: true)
                }
                Section(header: Text("Dietary Consideration")) {
                    Toggle("Is Vegan", isOn: $isVegan)
                    Toggle("Is Vegetarian", isOn: $isVegetarian)
                    Toggle("Is Dairy Free", isOn: $isDairyFree)
                    Toggle("Is Gluten Free", isOn: $isGlutenFree)
                    Toggle("Is Nut Free", isOn: $isNutFree)
                    Toggle("Is Egg Free", isOn: $isEggFree)
                }
                Section(header: Text("Ingredients")) {
                    ForEach(0..<ingredients.count, id: \.self) { index in
                        HStack {
                            Button(action: { ingredients.remove(at: index) }) {
                                Image(systemName: "minus.circle.fill")
                                    .foregroundColor(.red)
                                    .padding(.horizontal)
                            }
                            TextField("Ingredients", text: getBindingIngredients(forIndex: index))
                        }
                    }
                    Button(action: { ingredients.append("") }) {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .padding(.horizontal)
                            Text("add ingredient")
                        }
                    }
                }
                Section(header: Text("Instructions")) {
                    ForEach(0..<instructions.count, id: \.self) { index in
                        HStack {
                            Button(action: { instructions.remove(at: index) }) {
                                Image(systemName: "minus.circle.fill")
                                    .foregroundColor(.red)
                                    .padding(.horizontal)
                            }
                            TextField("Step \(index)", text: getBindingInstructions(forIndex: index))
                        }
                    }
                    Button(action: { instructions.append("") }) {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .padding(.horizontal)
                            Text("add steps")
                        }
                    }
                }
            }
            // Submit form button
            Button {
                checkInputs()
                if !error {
                    addRecipe()
                }
            } label: {
                HStack {
                    Spacer()

                    VStack {
                        Text("Add New Recipe button")
                            .padding()
                            .foregroundStyle(error ? .red : .blue)
                        Text(error ? "Some information is missing" : "")
                            .foregroundStyle(.red)
                    }
                    Spacer()

                }
            }
        }
        .navigationTitle("Post Recipe")
        //Text("Post Recipe View")
        // include a lot of textfields and drop downs
    }
}

#Preview {
    PostRecipeView()
}
