//
//  SearchView.swift
//  MooMenu
//
//  Created by Gavin Cartier on 4/27/24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(searchText: $searchText)
                // Show the filtered recipes here
            }
        }
    }
}

#Preview {
    SearchView()
}
