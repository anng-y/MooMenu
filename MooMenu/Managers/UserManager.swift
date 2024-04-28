//
//  UserManager.swift
//  MooMenu
//
//  Created by Ann Yip on 4/27/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class UserManager {
    
    static let shared = UserManager()
    private init() {}
    
    private let userCollection = Firestore.firestore().collection("users")
    
    private func userDocument(userId: String) -> DocumentReference {
        return userCollection.document(userId)
    }
    
    func createNewUser(user: UserModel) async throws {
        try userDocument(userId: user.userId).setData(from: user, merge: false)
    }
    
    func getUser(userId: String) async throws -> UserModel? {
        let document = try? await userDocument(userId: userId).getDocument()
        
        // Convert data to UserModel format
        if document?.exists ?? false {
            return try document?.data(as: UserModel.self)
        }
        
        return nil
    }
}
