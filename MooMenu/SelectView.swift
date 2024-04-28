//
//  SelectView.swift
//  MooMenu
//
//  Created by Ann Yip on 4/27/24.
//

import SwiftUI

struct SelectView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            FavoriteView()
                .tabItem {
                    Label("Favorite", systemImage: "heart")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
}

#Preview {
    SelectView()
}
