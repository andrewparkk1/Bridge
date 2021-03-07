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
        ScrollView(.vertical) {

            if postData.posts.isEmpty{
                Spacer(minLength: 0)
                
                if postData.noPosts{
                    Text("No Posts")
                }
                else {
//                    ProgressView()
//                        .foregroundColor(Color("bg")).ignoresSafeArea(.all, edges: .all)
//                        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
                    Text(" ")                        .foregroundColor(Color("bg")).ignoresSafeArea(.all, edges: .all)
                        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
                }
                Spacer(minLength: 0)
            }
            else {
                    VStack(spacing: 15) {
                        ForEach(postData.posts) { post in
                            PostRow(post: post, postData: postData)
                            Divider().ignoresSafeArea()
                        }
                    }
                    .padding()
                    .padding(.bottom, 55)

            }
            
        }
        .background(Color("bg").ignoresSafeArea(.all, edges: .all))


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
