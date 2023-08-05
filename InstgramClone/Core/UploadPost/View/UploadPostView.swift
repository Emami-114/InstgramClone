//
//  UploadPostView.swift
//  InstgramClone
//
//  Created by Ecc on 02.08.23.
//

import SwiftUI
import PhotosUI
struct UploadPostView: View {
    @State private var caption = ""
    @State private var imagePickerPresent = false
    @StateObject var viewModel = UploadPostViewModel()
    @Binding var tabIndex: Int
    
    var body: some View {
        VStack{
            HStack{
                Button{
                    cancel()
                  
                }label: {
                    Text("Cancel")
                }
                
                Spacer()
                Text("New Post")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button{
                    Task {
                        try await viewModel.uploadPost(caption: caption)

                        cancel()

                    }
                }label: {
                    Text("Upload")
                }
            }
            .padding(.horizontal)
            
            HStack (spacing: 8){
                if let image = viewModel.postImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100,height: 100)
                        .clipped()
                }
                  
                TextField("Enter your caption...", text: $caption,axis: .vertical)
            }
            .padding()
            Spacer()
        }
        .onAppear{
            imagePickerPresent.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresent, selection: $viewModel.selectedImage)
        
        
    }
    
    func cancel(){
        viewModel.selectedImage = nil
        viewModel.postImage = nil
        caption = ""

        tabIndex = 0
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView(tabIndex: .constant(0))
    }
}
