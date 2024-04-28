//
//  HomeView.swift
//  MooMenu
//
//  Created by Ann Yip on 4/27/24.
//

import SwiftUI

struct HomeView: View {
    @Binding var searchText: String
    
    init(searchText: Binding<String> = .constant("")) {
        _searchText = searchText
    }

    
    var body: some View {
        ScrollView {
            //Home section
            Text("Home")
                .font(.title)
                .fontWeight(.bold)
            
            
            
        }
        //.searchable(text: $searchText ?? .constant(""), placement: .automatic, prompt: Text("Search recipes"))
        
    }
}

#Preview {
    HomeView()
}
