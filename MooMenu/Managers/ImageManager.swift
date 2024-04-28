//
//  ImageManager.swift
//  MooMenu
//
//  Created by Ann Yip on 4/28/24.
//
import SwiftUI
import FirebaseStorage

final class ImageManager {
    
    static let shared = ImageManager()
    private init() { }
    
    private let storage = Storage.storage().reference()
    
    private func recipeReference(recipeID: String) -> StorageReference {
        storage.child("images").child(recipeID)
    }
    
    func saveImage(data: Data, recipeID: String) async throws -> String {
        let meta = StorageMetadata()
        meta.contentType = "image/jpeg"
        
        let path = "\(UUID().uuidString).jpeg"
        let returnedMetaData = try await recipeReference(recipeID: recipeID).child(path).putDataAsync(data, metadata: meta)
        
        guard let returnedName = returnedMetaData.name else {
            throw URLError(.badServerResponse)
        }
        return returnedName
    }
    
    func getImageURL(recipeID: String, path: String) async throws -> URL {
        return try await recipeReference(recipeID: recipeID).child(path).downloadURL()
    }
    
    func getAllImages(recipeID: String, images: [String]) async throws -> [URL] {
        var urls: [URL] = []
        for image in images {
            try await urls.append(getImageURL(recipeID: recipeID, path: image))
        }
        return urls
    }
}
