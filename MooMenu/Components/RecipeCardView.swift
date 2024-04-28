//
//  RecipeCardView.swift
//  MooMenu
//
//  Created by Gavin Cartier on 4/27/24.
//

import SwiftUI

struct RecipeCardView: View {
    var body: some View {
        Rectangle()
            .fill(Color.blue)
            .frame(height: 200)
            .border(Color.black)
            .padding()
    }
}

#Preview {
    RecipeCardView()
}
