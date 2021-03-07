//
//  PostView.swift
//  Gatton
//
//  Created by Andrew Park on 2/16/21.
//

//CHECKED

import SwiftUI

struct PostView: View {
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @StateObject var postData = PostViewModel()
    
    var body: some View {
        LazyVStack{
            
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
                        ForEach(postData.posts) { post in
                            PostRow(post: post, postData: postData)
                            Divider().ignoresSafeArea()
                        }
                    }
                    .padding()
                    .padding(.bottom, 55)
                }
                .ignoresSafeArea()
            }
            
        }
        .ignoresSafeArea()
    }
}

//struct PostView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostView()
//    }
//}


//            HStack{
//                Text("Posts")
//                    .font(.largeTitle)
//                    .fontWeight(.heavy)
//                    .foregroundColor(.white)
//                Spacer(minLength: 0)
//
//                Button(action: {postData.newPost.toggle()}) {
//                    Image(systemName: "square.and.pencil")
//                        .font(.title)
//                        .foregroundColor(.white)
//                }
//            }
//            .padding()
//            .padding(.top, edges!.top)
//            .background(Color("bg"))
//            .shadow(color: Color.white.opacity(0.06), radius: 5, x: 0, y: 5)
