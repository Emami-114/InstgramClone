//
//  LoginViewModel.swift
//  InstgramClone
//
//  Created by Ecc on 04.08.23.
//

import Foundation

class LoginViewModel : ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    
    func signIn() async throws{
        try await AuthService.shared.login(witEmail: email, password: password)
    }
    
}
