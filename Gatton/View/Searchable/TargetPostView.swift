//
//  TargetPostView.swift
//  Gatton
//
//  Created by Andrew Park on 2/26/21.
//

import SwiftUI

struct TargetPostView: View {
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @StateObject var postData = PostViewModel()
    var target: String
    @Environment(\.presentationMode) var mode
    @GestureState private var dragOffset = CGSize.zero
    @State var color = Color(.red)
    
    var body: some View {
        VStack{
            
            HStack{
                Button(action: {
                    mode.wrappedValue.dismiss()
                }, label: {
                    Text("Back")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                })
                Spacer()

                Text(target)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(color)
                Spacer(minLength: 0)
                
                Button(action: {postData.newPost.toggle()}) {
                    Image(systemName: "square.and.pencil")
                        .font(.title)
                        .foregroundColor(.white)
                }
            }
            .padding()
            .padding(.top, edges!.top)
            .background(Color("bg"))
            .shadow(color: Color.white.opacity(0.06), radius: 5, x: 0, y: 5)
            
            if postData.posts.isEmpty {
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
                        if target == "Professors" {
                            ForEach(postData.professors) { post in
                                PostRow(post: post, postData: postData)
                                Divider().ignoresSafeArea()
                            }
                        }
                        if target == "Classes" {
                            ForEach(postData.classes) { post in
                                PostRow(post: post, postData: postData)
                                Divider().ignoresSafeArea()
                            }
                        }
                        if target == "Research" {
                            ForEach(postData.research) { post in
                                PostRow(post: post, postData: postData)
                                Divider().ignoresSafeArea()
                            }
                        }
                        if target == "QandA" {
                            ForEach(postData.qanda) { post in
                                PostRow(post: post, postData: postData)
                                Divider().ignoresSafeArea()
                            }
                        }
                        if target == "Colleges" {
                            ForEach(postData.colleges) { post in
                                PostRow(post: post, postData: postData)
                                Divider().ignoresSafeArea()
                            }
                        }
                    }
                    .padding()
                    .padding(.bottom, 55)
                }
            }
        }
        .navigationBarHidden(true)
        .ignoresSafeArea().edgesIgnoringSafeArea(.top)
        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
        .gesture(DragGesture().updating($dragOffset, body: { (value, state, transaction) in
            
            if(value.translation.width > 100) {
                self.mode.wrappedValue.dismiss()
            }
            
        }))
    }
}

//struct PostView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostView()
//    }
//}
