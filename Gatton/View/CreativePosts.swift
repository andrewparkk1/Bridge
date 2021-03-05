//
//  CreativePosts.swift
//  Gatton
//
//  Created by Andrew Park on 3/5/21.
//

import SwiftUI

struct CreativePosts: View {
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @StateObject var postData = PostViewModel()
    
    var body: some View {
        VStack{
            
            HStack{
                Text("Creativity")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                Spacer(minLength: 0)
                
                Button(action: {postData.newPost.toggle()}) {
                    Image(systemName: "square.and.pencil")
                        .font(.title)
                        .foregroundColor(.white)
                }
            }
            .padding()
            .padding(.top, edges!.top)
            //top shadow effect
            .background(Color("bg"))
            .shadow(color: Color.white.opacity(0.06), radius: 5, x: 0, y: 5)
            
            if postData.posts.isEmpty{
                Spacer(minLength: 0)
                
                if postData.noPosts{
                    Text("No Posts")
                } else {
                    ProgressView()
                }
                Spacer(minLength: 0)
            }
            else {
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(postData.creative) { post in
                            PostRow(post: post, postData: postData)
                            Divider().ignoresSafeArea()
                        }
                    }
                    .padding()
                    .padding(.bottom, 55)
                }
            }
            
        }
        .fullScreenCover(isPresented: $postData.newPost, content: {
            NewPostHome(updateId: $postData.updateId)
        })
    }
}
