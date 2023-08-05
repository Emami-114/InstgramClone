//
//  FeedCell.swift
//  InstgramClone
//
//  Created by Ecc on 31.07.23.
//

import SwiftUI
import Kingfisher
struct FeedCell: View {
    let post : Post
    var body: some View {
        VStack{
            
            HStack{
                if let user = post.user {
                    CircularProfileImage(user: user, size: .xSmall)
                    Text(user.userName)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
              
            Spacer()
            }
            .padding(.leading, 8)
            
            KFImage(URL(string: post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
            
            HStack(spacing: 16){
                ButtonAction(image: "heart", action: {print("Like post")})
                ButtonAction(image: "bubble.right", action: {print("Comment on Post")})
               ButtonAction(image: "paperplane", action: {print("Share post")})
            
               
                Spacer()
            }
            .padding(.leading,8)
            .padding(.top,4)
            .foregroundColor(.black)
            
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.leading,10)
                .padding(.top,1)
            HStack{
                Text("\(post.user?.userName ?? "") ").fontWeight(.semibold) +
                Text(post.caption)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .font(.footnote)
            .padding(.leading,10)
            .padding(.top,0.5)
            
            Text("6h ago")
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading,10)
                .padding(.top,1)
                .foregroundColor(.gray)
            
        }
        
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(post: Post.MOCK_POSTS[3])
    }
}
