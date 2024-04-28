//
//  ContentView.swift
//  MooMenu
//
//  Created by Ann Yip on 4/27/24.
//

import SwiftUI

struct RootView: View {
    
    @State private var showSignInView: Bool = false
    
    var body: some View {
        ZStack {
            if !showSignInView {
                NavigationStack {
                    HomeView(showSignInView: $showSignInView)
                }
                .background {
                    Color(.white)
                        .ignoresSafeArea()
                }
            }
        }
        .padding()
        .onAppear {
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.showSignInView = authUser == nil
        }
        .fullScreenCover(isPresented: $showSignInView, content: {
            NavigationStack {
                LoginView(showSignInView: $showSignInView)
            }
        })
    }
}

#Preview {
    RootView()
}

