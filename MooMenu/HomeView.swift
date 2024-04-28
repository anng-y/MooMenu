//
//  HomeView.swift
//  MooMenu
//
//  Created by Ann Yip on 4/27/24.
//

import SwiftUI

struct HomeView: View {
    @Binding var searchText: String
    @State private var firstLoaded: Bool = true
    
    init(searchText: Binding<String> = .constant("")) {
        _searchText = searchText
    }
    @EnvironmentObject private var viewModel: SelectViewModel

    
    var body: some View {
        ScrollView {
            //Home section
            Text("Home")
                .font(.title)
                .fontWeight(.bold)
            VStack {
                ForEach(viewModel.RecipeIds, id: \.self) { recipeId in
                    let recipe = viewModel.RecipeHash[recipeId]
                    NavigationLink {
                        RecipeView(recipe: recipe)
                    } label: {
                        RecipeItemView(recipe: recipe)
                    }
                }
            }
        }
        .onAppear() {
            Task {
                do {
                    if firstLoaded {
                        try await viewModel.loadRecipes()
                        firstLoaded = false
                    }
                }
            }
        }
        /* .refreshable {
            do {
                // Reload by push down
                try await viewModel.loadAllArea()
                
            }
        } */
        //.searchable(text: $searchText ?? .constant(""), placement: .automatic, prompt: Text("Search recipes"))
    }
}

#Preview {
    HomeView()
        .environmentObject(SelectViewModel())
}
