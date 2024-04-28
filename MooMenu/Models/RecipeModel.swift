//
//  RecipeModel.swift
//  MooMenu
//
//  Created by Ann Yip on 4/28/24.
//

import Foundation

struct RecipeModel: Codable {
    let id: String
    let images: [String]?
    let title: String
    let timeDone: Int
    let summary: String
    let isVegan: Bool
    let isVegetarian: Bool
    let isDairyFree: Bool
    let isGlutenFree: Bool
    let isNutFree: Bool
    let isEggFree: Bool
    let ingredients: [String]
    let instructions: [String]
    
    init(id: String, images: [String]?, title: String, timeDone: Int, summary: String, isVegan: Bool, isVegetarian: Bool, isDairyFree: Bool, isGlutenFree: Bool, isNutFree: Bool, isEggFree: Bool, ingredients: [String], instructions: [String]) {
        self.id = id
        self.images = images
        self.title = title
        self.timeDone = timeDone
        self.summary = summary
        self.isVegan = isVegan
        self.isVegetarian = isVegetarian
        self.isDairyFree = isDairyFree
        self.isGlutenFree = isGlutenFree
        self.isNutFree = isNutFree
        self.isEggFree = isEggFree
        self.ingredients = ingredients
        self.instructions = instructions
    }
    
    enum CodingKeys: CodingKey {
        case id
        case images
        case title
        case timeDone
        case summary
        case isVegan
        case isVegetarian
        case isDairyFree
        case isGlutenFree
        case isNutFree
        case isEggFree
        case ingredients
        case instructions
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encodeIfPresent(self.images, forKey: .images)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.timeDone, forKey: .timeDone)
        try container.encode(self.summary, forKey: .summary)
        try container.encode(self.isVegan, forKey: .isVegan)
        try container.encode(self.isVegetarian, forKey: .isVegetarian)
        try container.encode(self.isDairyFree, forKey: .isDairyFree)
        try container.encode(self.isGlutenFree, forKey: .isGlutenFree)
        try container.encode(self.isNutFree, forKey: .isNutFree)
        try container.encode(self.isEggFree, forKey: .isEggFree)
        try container.encode(self.ingredients, forKey: .ingredients)
        try container.encode(self.instructions, forKey: .instructions)
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.images = try container.decodeIfPresent([String].self, forKey: .images)
        self.title = try container.decode(String.self, forKey: .title)
        self.timeDone = try container.decode(Int.self, forKey: .timeDone)
        self.summary = try container.decode(String.self, forKey: .summary)
        self.isVegan = try container.decode(Bool.self, forKey: .isVegan)
        self.isVegetarian = try container.decode(Bool.self, forKey: .isVegetarian)
        self.isDairyFree = try container.decode(Bool.self, forKey: .isDairyFree)
        self.isGlutenFree = try container.decode(Bool.self, forKey: .isGlutenFree)
        self.isNutFree = try container.decode(Bool.self, forKey: .isNutFree)
        self.isEggFree = try container.decode(Bool.self, forKey: .isEggFree)
        self.ingredients = try container.decode([String].self, forKey: .ingredients)
        self.instructions = try container.decode([String].self, forKey: .instructions)
    }
}
