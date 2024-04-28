//
//  ProfileView.swift
//  MooMenu
//
//  Created by Ann Yip on 4/27/24.
//

import SwiftUI

struct ProfileView: View {

    
    @Binding var showSignInView: Bool
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        VStack {
            // Profile Details / Logout
            VStack(alignment: .center, spacing: 7) {
                HStack {
                    // PROFILE IMAGE
                    if let userImage = userViewModel.user?.photoUrl {
                        AsyncImage(url: URL(string: userImage)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(Color("TextColor"), lineWidth: 2)
                                )
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    VStack (alignment: .leading){
                        // USER NAME
                        Text("\(userViewModel.user?.name ?? "User Name")")
                            .font(.custom("Futura", size: 18))
                            .fontWeight(.semibold)
                            //.foregroundStyle(Color("TextColor"))
                        // USER EMAIL
                        Text("\(userViewModel.user?.email ?? "test@testtestestest.com")")
                            //.foregroundStyle(Color("TextColor"))
                            .font(.custom("Futura", size: 16))
                        Text("Logout")
                            .font(.custom("Futura", size: 12))
                            .foregroundStyle(.red)
                            .onTapGesture {
                                Task {
                                    do {
                                        try AuthenticationManager.shared.signOut()
                                        // Removes monitored areas
                                        showSignInView = true
                                    }
                                    catch {
                                        print("Failed Logout")
                                    }
                                }
                            }
                            .frame(width: 60, height: 24)
                            .overlay( /// apply a rounded border
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.red, lineWidth: 0.8)
                            )
                    }
                    .padding(.leading, 16)
                    Spacer()
                }
                Spacer()
            }
            Divider()
        }
    }
}

#Preview {
    ProfileView(showSignInView: .constant(false))
        .environmentObject(UserViewModel())
}
