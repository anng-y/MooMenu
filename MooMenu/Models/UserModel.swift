//
//  UserModel.swift
//  MooMenu
//
//  Created by Ann Yip on 4/27/24.
//

import Foundation

struct UserModel: Codable {
    let userId: String
    let email: String?
    let name: String?
    let photoUrl: String?
    //let dateCreated: Date?
    let favorites: [String]
    let admin: Bool?
    
    // Initialize User from the Result of Google Sign In
    init(auth: AuthDataResultModel) {
        self.userId = auth.uid
        self.name = auth.name
        self.email = auth.email
        self.photoUrl = auth.photoUrl
        //self.dateCreated = Date()
        self.favorites = []
        self.admin = false
    }
    
    enum CodingKeys: CodingKey {
        case userId
        case email
        case name
        case photoUrl
        case favorites
        case admin
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.photoUrl = try container.decodeIfPresent(String.self, forKey: .photoUrl)
        self.favorites = try container.decode([String].self, forKey: .favorites)
        self.admin = try container.decodeIfPresent(Bool.self, forKey: .admin)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.userId, forKey: .userId)
        try container.encodeIfPresent(self.email, forKey: .email)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.photoUrl, forKey: .photoUrl)
        try container.encode(self.favorites, forKey: .favorites)
        try container.encodeIfPresent(self.admin, forKey: .admin)
    }
}
