//
//  ImageManager.swift
//  MooMenu
//
//  Created by Ann Yip on 4/27/24.
//

import SwiftUI
import FirebaseStorage

final class ImageManager {
    
    static let shared = ImageManager()
    private init() { }
    
    private let storage = Storage.storage().reference()
    
    func saveImage(data: Data) async throws -> String {
        let meta = StorageMetadata()
        meta.contentType = "image/jpeg"
        
        let path = "\(UUID().uuidString).jpeg"
        //let returnedMetaData = try await areaReference(areaID: areaID, isArea: isArea).child(path).putDataAsync(data, metadata: meta)
        
        guard let returnedName = returnedMetaData.name else {
            throw URLError(.badServerResponse)
        }
        return returnedName
    }
    
    func getImageURL(recipeID: String, path: String, isArea: Bool) async throws -> URL {
        return try await areaReference(areaID: areaID, isArea: isArea).child(path).downloadURL()
    }
    
    func getAllImages(userID: String, images: [String], isArea: Bool) async throws -> [URL] {
        var urls: [URL] = []
        for image in images {
            try await urls.append(getImageURL(areaID: areaID, path: image, isArea: isArea))
        }
        return urls
    }
}
