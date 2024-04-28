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
            // Post Recipe View
        } label: {
            Text("Post recipe!")
        }
    }
}

#Preview {
    PostRecipeButton()
}
