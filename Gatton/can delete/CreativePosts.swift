////
////  CreativePosts.swift
////  Gatton
////
////  Created by Andrew Park on 3/5/21.
////
//
//import SwiftUI
//
//struct CreativePosts: View {
//    var edges = UIApplication.shared.windows.first?.safeAreaInsets
//    @StateObject var postData = PostViewModel()
//
//
//    var body: some View {
//        ScrollView(.vertical) {
//
//
//            if postData.posts.isEmpty{
//                Spacer(minLength: 0)
//
//                if postData.noPosts{
//                    Text("No Posts")
//                        .foregroundColor(.white)
//                }
//                else {
//                    Text(" ")                        .foregroundColor(Color("bg")).ignoresSafeArea(.all, edges: .all)
//                        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
//                }
//                Spacer(minLength: 0)
//            }
//            else {
//                VStack(spacing: 15) {
//                    ForEach(postData.creativity) { post in
//                        PostRow(post: post, postData: postData)
//                        Divider().ignoresSafeArea()
//                    }
//                }
//                .padding()
//                .padding(.bottom, 55)
//            }
//
//        }
//        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
//
//
//    }
//}
//
//
////        .fullScreenCover(isPresented: $postData.newPost, content: {
////            NewPostHome(updateId: $postData.updateId)
////        })
//
//
//
////            HStack{
////                Text("Creativity")
////                    .font(.largeTitle)
////                    .fontWeight(.heavy)
////                    .foregroundColor(.white)
////                Spacer(minLength: 0)
////
////                Button(action: {postData.newPost.toggle()}) {
////                    Image(systemName: "square.and.pencil")
////                        .font(.title)
////                        .foregroundColor(.white)
////                }
////            }
////            .padding()
////            .padding(.top, edges!.top)
////            .background(Color("bg"))
////            .shadow(color: Color.white.opacity(0.06), radius: 5, x: 0, y: 5)
