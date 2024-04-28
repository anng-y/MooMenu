//
<<<<<<< HEAD
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
    
=======
//  RecipeStoring.swift
//  MooMenu
//
//  Created by Kunal L on 4/27/24.
//

import Foundation


func ParseRecipes(json_file: String) {
    let path = Bundle.main.path(forResource: json_file, ofType: "json", inDirectory: "Resources") {
            let jsonData =  Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let jsonObject =  JSONSerialization.jsonObject(with: jsonData, options: [])
            if let jsonDictionary = jsonObject as? [String: Any] {
                var recipes_array : [Recipe] = []
                if let recipes_array = jsonDictionary["recipes"] as? [[String: Any]] {
                    
                    for x in recipes_array {
                        var ingredients = [String]()
                        let id = x["id"] as? Int
                        let title = x["title"] as? String
                        let summary = x["summary"] as? String
                        let image = x["image"] as? String
                        
                        let extendedIngredients = x["extendedIngredients"] as? [[String: Any]] {
                        for y in extendedIngredients {
                            if let original = y["original"] as? String {
                                ingredients.append(original)
                            }
                        }
                    }
                }
                    
            }
        } catch {
            print("Error reading JSON file:", error)
        }
    } else {
            print("JSON file not found")
        }
    }
}







//// testing recipe card with a single api call for a recipe
//let API_Key = "204047ddb05b4d92b8d5a0f7061f30c0"
//
//func fetchRecipeInstructions() {
//    for _ in 0...29  {
//        let id = Int.random(in: 1...100000)
//        // the API request URL
//        let apiUrl = URL(string: "https://api.spoonacular.com/recipes/\(id)/information?apiKey=\(API_Key)")!
//        
//        // Create a URL session
//        let session = URLSession.shared
//        
//        // Create a Get URLRequest with the API URL
//        var request = URLRequest(url: apiUrl)
//        request.httpMethod = "GET"
//        
//        let task = session.dataTask(with: request) { (data, response, error) in
//            
//            if let error = error {
//                    print("Error")
//                    return
//            }
//                
//            // Check if there is data
//            guard let responseData = data else {
//                print("No data received")
//                return
//            }
//            
//            do {
//                // Use JSONSerialization to parse the data into a dictionary
//                if let json = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any] {
//                    // Access the data in the JSON dictionary
//                    print("JSON response: \(json)")
//                            
//                    
//                    if let value = json["key"] as? String {
//                            print("Value: \(value)")
//                        }
//                    } else {
//                            print("Invalid JSON format")
//                        }
//                    } catch {
//                        print("Error parsing JSON: \(error)")
//                    }
//            
//                
//            }
//        
//        
//    }
//    
//}


>>>>>>> bc5cbf58699dd04307f8203abb02728c043bd6df
