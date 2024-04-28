//
//  RecipeItemView.swift
//  MooMenu
//
//  Created by Ann Yip on 4/27/24.
//

import SwiftUI

struct RecipeItemView: View {
    let recipe: RecipeModel?
    var body: some View {
        HStack (alignment: .top) {
//            Image("spaghet.png")
//                .resizable(resizingMode: .stretch)
//                .clipShape(RoundedRectangle(cornerRadius: 10))
//                .frame(width: 140, height: 140)
//            
            // Details of SubArea
            VStack {
                // Name, Rating, Floor, and Favorite
                Spacer()
                HStack(alignment: .center) {
                    // Area name and Time Range
                    VStack (alignment: .leading, spacing: 4) {
                        Text("Recipe name")
                            .font(.custom("Futura", size: 25))
                        Text("Time until ready")
                    }
                    .font(.footnote)
                    Spacer()
                    
                    // Is My Favorite Button
                    VStack (spacing: 10) {
                        // favorite button
                        Image(systemName: "heart.fill")
                            .foregroundStyle(.red)
                            .font(.title2)
                        //HeartButtonView(subAreaId: subArea?.subAreaId)
                            //.environmentObject(userViewModel)
                    }
                    .padding(.bottom, 20)
                }
                Spacer()
            }
            .padding(.horizontal, 8)
        }
        .frame(height: 140)
        .font(.caption)
        .clipShape(RoundedRectangle(cornerRadius: 6))
    }
}

#Preview {
    RecipeItemView(recipe: nil)
}
