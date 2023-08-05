//
//  SearchView.swift
//  InstgramClone
//
//  Created by Ecc on 01.08.23.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @StateObject var viewModel = SearchViewModel()
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVStack(spacing: 12){
                    ForEach(viewModel.users){user in
                        NavigationLink(value: user) {
                            HStack{
                               
                                CircularProfileImage(user: user, size: .xSmall)
                            
                                VStack(alignment: .leading){
                                    Text(user.userName)
                                        .fontWeight(.semibold)
                                    if let fullName = user.fullname {
                                        Text(fullName)
                                    }
                            }
                                .font(.footnote)
                                Spacer()
                            }
                            .foregroundColor(.black)
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.top,8)
                .searchable(text: $searchText, prompt: "Search...")
            }
            .navigationDestination(for: User.self, destination: {user in
                ProfileView(user: user)
            })
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
