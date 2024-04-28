//
//  Recipes.swift
//  MooMenu
//
//  Created by Kunal L on 4/27/24.
//

import SwiftUI

struct Recipe {
    // dictionary of nutrients
    // Key is step number, value is string describing the step
    var instructionsDict = [Int: String]()
    // title
    let title : String
    // dictionary of nutrients
    // key is nutrient name,
    // value is string
    var nutrientsDict = [String: String]()
    
    // array of ingredients
    var ingredients = [String]()
    
    //image
    var rec_image : String
    
    // recipe id
    let id: Int
    
    // summary
    let summary: String
    
    init(instructionsDict: [Int : String] = [Int: String](), title: String, nutrientsDict: [String : String] = [String: String](), ingredients: [String] = [String](), rec_image: String, id: Int, summary: String) {
        self.instructionsDict = instructionsDict
        self.title = title
        self.nutrientsDict = nutrientsDict
        self.ingredients = ingredients
        self.rec_image = rec_image
        self.id = id
        self.summary = summary
    }
    
    
    
    
}

//#Preview {
    
//}
