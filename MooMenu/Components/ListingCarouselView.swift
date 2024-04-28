//
//  ListingCarouselView.swift
//  MooMenu
//
//  Created by Ann Yip on 4/28/24.
//

import SwiftUI

struct ListingCarouselView: View {
    let recipe: RecipeModel?
    
    @State private var urls: [URL]? = nil
    
    var body: some View {
        // List Images
        TabView {
            if let urls {
                ForEach(urls, id: \.self) { url in
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }
                }
            } else {
                VStack {
                    Image("StudyBarnLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                }
            }
        }
        .tabViewStyle(.page)
        .ignoresSafeArea()
        // Get Image URLs
        .task (id: recipe?.id) {
            if let recipe = recipe{
                if let images = recipe.images {
                    if !images.isEmpty {
                        let urls = try? await ImageManager.shared.getAllImages(recipeID: recipe.id, images: images)
                        self.urls = urls
                    }
                }
            }
        }
    }
}

#Preview {
    ListingCarouselView(recipe: nil)
}
