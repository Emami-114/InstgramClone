//
//  ContentView.swift
//  InstgramClone
//
//  Created by Ecc on 31.07.23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    @StateObject var registrationViewModel = RegistrationViewModel()
    
    
    var body: some View {
        Group{
            if viewModel.userSession == nil {
                LoginView()
                    .environmentObject(registrationViewModel)
            } else if let currentuser = viewModel.currentUser {
                MainTabView(user: currentuser)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
