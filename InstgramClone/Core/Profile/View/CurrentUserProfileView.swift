//
//  CurrentUserProfileView.swift
//  InstgramClone
//
//  Created by Ecc on 02.08.23.
//

import SwiftUI
struct CurrentUserProfileView: View {
    private let gridItems : [GridItem] = [
        .init(.flexible(),spacing: 1),
        .init(.flexible(),spacing: 1),
        .init(.flexible(),spacing: 1),
    ]
    let user : User
    
  
    
    var body: some View {
        NavigationStack {
            ScrollView{
                
                
                ProfileHeaderView(user: user)
                
                PostGridView(user: user)
                .navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button{
                            AuthService.shared.signOut()
                        }label: {
                            Image(systemName: "line.3.horizontal")
                                .foregroundColor(.black)
                        }
                    }
                }
            }
        }
        
    }
}

struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileView(user: User.MOCK_USERS[0])
    }
}
