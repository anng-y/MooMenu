//
//  LoginView.swift
//  MooMenu
//
//  Created by Ann Yip on 4/27/24.
//

import SwiftUI

struct LoginView: View {
    
    @Binding var showSignInView: Bool
    
    var body: some View {
        Text("Let's get started.")
            .font(.custom("Futura", size: 28))
            .foregroundStyle(Color("TitleFont"))
        Divider()
            .padding()
        GoogleSignInButton(showSignInView: $showSignInView)
    }
}

#Preview {
    LoginView(showSignInView: .constant(false))
}
