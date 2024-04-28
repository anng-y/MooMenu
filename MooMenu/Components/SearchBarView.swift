//
//  SearchBarView.swift
//  MooMenu
//
//  Created by Gavin Cartier on 4/27/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String

    var body: some View {
        NavigationStack {
        }
        .searchable(text: $searchText, placement: .automatic, prompt: Text("Search recipes"))
        .padding(.horizontal)
    }
}

#Preview {
    SearchBar(searchText: .constant(""))
}
