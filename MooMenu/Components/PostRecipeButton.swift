//
//  PostRecipeButton.swift
//  MooMenu
//
//  Created by Ann Yip on 4/28/24.
//

import SwiftUI

struct PostRecipeButton: View {
    var body: some View {
        NavigationLink {
            PostRecipeView()
        } label: {
            Text("Post recipe!")
                .font(.custom("Futura", size: 20))
                .foregroundStyle(.blue)
                .frame(width: 200.0, height: 40.0)
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .overlay {
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(lineWidth: 0.5)
                        .foregroundStyle(Color(.systemGray4))
                        .cornerRadius(40)
                        .shadow(color: .black.opacity(0.6), radius:2)
                }
        }
    }
}

#Preview {
    PostRecipeButton()
}
