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
        TextField("Search recipes", text: $searchText)
            
        
    }
}

#Preview {
    SearchBar(searchText: .constant(""))
}
