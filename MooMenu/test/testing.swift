////
////  SmallRecipe.swift
////  MooMenu
////
////  Created by Kunal L on 4/27/24.
////
//
//import SwiftUI
//import Foundation
//
//
//func ParseRecipes(json_file: String) -> [Recipe]? {
//    // obtain file path of JSON file from the app's resource bundle
//    if let path = Bundle.main.path(forResource: json_file, ofType: "json") {
//        do {
//            // create data object from file in path
//            let jsonData = try Data(contentsOf: URL(fileURLWithPath: path))
//            // parse json data into swift foundation object
//            let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
//            // cast json object into dictionary with keys of strings and values of any
//            if let jsonDictionary = jsonObject as? [String: Any],
//               // extract array of recipe data from dictionary, wiht key recipes mapping
//               // to array of dictionaries
//                let recipesArray = jsonDictionary["recipes"] as? [[String: Any]] {
//                
//                // set up array of recipes
//                var recipes: [Recipe] = []
//                
//                // loop through each recipedata as a dict in recipesarray
//                for recipeData in recipesArray {
//                    // store recipe id
//                    if let id = recipeData["id"] as? Int,
//                       // store time to cook
//                        let time = recipeData["readyInMinutes"] as? Int,
//                       // store title
//                        let title = recipeData["title"] as? String,
//                       // store the summary
//                        let summary = recipeData["summary"] as? String,
//                       // store the url for the imagae
//                        let image = recipeData["image"] as? String,
//                       // storing array of ingredients as an array of dictionaries with each
//                      // dictionary being a ingredient
//                        let extendedIngredients = recipeData["extendedIngredients"] as? [[String: Any]],
//                       // storing array of instructions as an array of dictionaries with each
//                      // dictionary being a instruction
//                        let instructions = recipeData["analyzedInstructions"] as? [[String: Any]],
//                       
//                        // storing array of nutrients as an array of dictionaries with each
//                       // dictionary being a nutrient
//                        let nutrientsArray = recipeData["nutrition"] as? [[String: Any]] {
//                        
//                        // Initialize dictionary to store nutrients
//                        var nutrientsDict = [String: String]()
//                        // Loop through each nutrient dictionary
//                        for nutrient in nutrientsArray {
//                            if let name = nutrient["name"] as? String,
//                                let amount = nutrient["amount"] as? Double,
//                                let unit = nutrient["unit"] as? String {
//                                // Concatenate name, amount, and unit as a string value
//                                    let stringValue = "\(amount) \(unit)"
//                                    // Store in nutrients dictionary with name as key
//                                    nutrientsDict[name] = stringValue
//                                }
//                        }
//                        
//                        // intialize array of ingredients
//                        var ingredients = [String]()
//                        // loop through each ingredient dictionary
//                        for ingredient in extendedIngredients {
//                            // check if original is stored as a string
//                            if let original = ingredient["original"] as? String {
//                                // append it to the array
//                                ingredients.append(original)
//                            }
//                        }
//                        
//                        // intialize the dictionary of instructions
//                        var instructionDict = [Int: String]()
//                        // loop through each instruction dictionary
//                        for instructionData in instructions {
//                            // store the steps as a dictionary of strings
//                            if let steps = instructionData["steps"] as? [[String: Any]] {
//                                // loop through each step dictionary
//                                for step in steps {
//                                    // if the step number is a int
//                                    if let stepNumber = step["number"] as? Int,
//                                       // store the step number as a key
//                                       // store the description as its value of string
//                                        let stepDescription = step["step"] as? String {
//                                        instructionDict[stepNumber] = stepDescription
//                                    }
//                                }
//                            }
//                            
//                        }
//                        
//                        let recipe = Recipe(
//                            instructionsDict: instructionDict,
//                            title: title,
//                            nutrientsDict: nutrientsDict,
//                            ingredients: ingredients,
//                            rec_image: image,
//                            id: id,
//                            summary: summary,
//                            time: time
//                        )
//                        recipes.append(recipe)
//                    }
//                }
//                return recipes
//            }
//        } catch {
//            print("Error reading JSON file:", error)
//        }
//    } else {
//        print("JSON file not found")
//    }
//    return nil
//}
//
//
////func testParsing() {
////    var recipes: [Recipe] = []
////    if let parsedRecipes = ParseRecipes(json_file: "vegan") {
////        recipes = parsedRecipes
////        if let firstRecipe = recipes.first {
////            print("This is the id \(firstRecipe.id)")
////            print("This is the title \(firstRecipe.title)")
////            print("Ingredients")
////            for line in firstRecipe.ingredients {
////                print(line)
////            }
////            print("Instructions")
////            for (key, value) in firstRecipe.instructionsDict{
////                print("Key: \(key)")
////                print("Value: \(value)")
////            }
////            print("Nutrients")
////            for (key, value) in firstRecipe.nutrientsDict{
////                print("Key: \(key)")
////                print("Value: \(value)")
////            }
////            print("Image url: \(firstRecipe.rec_image)")
////            print("Sumary: \(firstRecipe.summary)")
////            print("Time: \(firstRecipe.time)")
////            
////        } else {
////            print("No recipe found.")
////        }
////    } else {
////        print("Failed to parse recipes.")
////    }
////}
//
//
//struct TestParsingOutputView: View {
//    let parsedRecipes = ParseRecipes(json_file: "vegan")
//
//    var body: some View {
//        if let firstRecipe = parsedRecipes?.first {
//            // Access the properties of the first recipe safely
//            return ScrollView {
//                VStack {
//                    Text("This is the id \(firstRecipe.id)")
//                    Text("This is the title \(firstRecipe.title)")
//                    Text("Ingredients:")
//                    ForEach(firstRecipe.ingredients, id: \.self) { ingredient in
//                        Text(ingredient)
//                    }
//                    Text("Instructions:")
//                    ForEach(firstRecipe.instructionsDict.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
//                        Text("Step \(key): \(value)")
//                    }
//                    Text("Nutrients:")
//                    ForEach(firstRecipe.nutrientsDict.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
//                        Text("\(key): \(value)")
//                    }
//                    Text("Image url: \(firstRecipe.rec_image)")
//                    Text("Summary: \(firstRecipe.summary)")
//                    Text("Time: \(firstRecipe.time)")
//                }.padding()
//            }
//            .eraseToAnyView()
//        } else {
//            return Text("No recipe found.")
//                .eraseToAnyView()
//        }
//    }
//}
//
//extension View {
//    func eraseToAnyView() -> AnyView {
//        AnyView(self)
//    }
//}
//
//struct Content: View {
//    var body: some View {
//        VStack {
//            Text("Output of testParsing():")
//                .font(.title)
//                .padding()
//            TestParsingOutputView()
//        }
//    }
//}
//
//#Preview {
//    Content()
//}
//
//
////struct ContentView_Previews: PreviewProvider {
////    static var previews: some View {
////        Content()
////    }
////}
