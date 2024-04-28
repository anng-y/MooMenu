//
//  SelectView.swift
//  MooMenu
//
//  Created by Ann Yip on 4/27/24.
//

import SwiftUI

struct SelectView: View {
    @Binding var showSignInView: Bool
    @StateObject var userViewModel = UserViewModel()
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
            ProfileView(showSignInView: $showSignInView)
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
                .environmentObject(userViewModel)
        }
        .task {
            try? await userViewModel.loadUser()
            // set user to selectViewModel when user gets loaded
            //viewModel.setUserId(userId: userViewModel.user?.userId)
        }
    }
}

#Preview {
    SelectView(showSignInView: .constant(false))
}
