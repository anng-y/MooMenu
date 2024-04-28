//
//  HomeView.swift
//  MooMenu
//
//  Created by Ann Yip on 4/27/24.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var showSignInView: Bool
    
    var body: some View {
        Text("HomeView")
    }
}

#Preview {
    HomeView(showSignInView: .constant(false))
}
