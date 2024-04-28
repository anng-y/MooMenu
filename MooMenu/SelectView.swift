//
//  SelectView.swift
//  MooMenu
//
//  Created by Ann Yip on 4/27/24.
//

import SwiftUI

struct SelectView: View {
    @Binding var showSignInView: Bool
    @StateObject private var viewModel: SelectViewModel = SelectViewModel()
    @StateObject private var userViewModel = UserViewModel()
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .environmentObject(viewModel)
                .environmentObject(userViewModel)
            ProfileView(showSignInView: $showSignInView)
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
                .environmentObject(viewModel)
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
