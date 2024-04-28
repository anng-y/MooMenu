//
//  UserViewModel.swift
//  MooMenu
//
//  Created by Ann Yip on 4/27/24.
//

import Foundation

@MainActor
final class UserViewModel: ObservableObject {
    @Published private(set) var user: UserModel? = nil
    
    // Load Authenticated User from the Database
    func loadUser() async throws {
        let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
        self.user = try await UserManager.shared.getUser(userId: authDataResult.uid)
    }
}
