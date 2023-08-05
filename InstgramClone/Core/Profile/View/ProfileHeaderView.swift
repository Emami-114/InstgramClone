//
//  ProfileHeaderView.swift
//  InstgramClone
//
//  Created by Ecc on 02.08.23.
//

import SwiftUI

struct ProfileHeaderView: View {
    @State private var showEditProfile = false
    let user : User
    var body: some View {
        VStack(spacing: 10){
        
        HStack{
            CircularProfileImage(user: user,size: .large)
            Spacer()
            HStack(spacing: 9){
                UserStateView(value: 3, title: "posts")
                UserStateView(value: 12, title: "Followers")
                UserStateView(value: 24, title: "Following")
            }
        }
        .padding(.horizontal)
        
        VStack(alignment: .leading, spacing: 4){
            if let fullName = user.fullname {
                Text(fullName)
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
           
            if let bio = user.bio {
                Text(bio)
                    .font(.footnote)
            }
           
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
        
        Button{
            if user.isCurrenUser {
                showEditProfile.toggle()
            }else {
                print("Follow user...")
            }
        }label: {
            Text(user.isCurrenUser ? "Edit Profile" : "Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 360,height: 32)
                .background(user.isCurrenUser ? .white : Color(.systemBlue))
                .cornerRadius(8)
                .foregroundColor(user.isCurrenUser ? .black : .white)
                .overlay{
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(user.isCurrenUser ? Color.gray : .clear,lineWidth: 1)
                }
        }
            Divider()
    }
        .fullScreenCover(isPresented: $showEditProfile){
            EditProfileView(user: user)
        }
        
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User.MOCK_USERS[0])
    }
}
