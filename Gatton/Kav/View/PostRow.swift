//
//  PostRow.swift
//  Gatton
//
//  Created by Andrew Park on 2/17/21.
//

//CHECKED

import SwiftUI
import SDWebImageSwiftUI
import Firebase

//struct PostRow: View {
//
//    var post: PostModel
//    @ObservedObject var postData: PostViewModel
//    let uid = Auth.auth().currentUser!.uid
//
//    var body: some View {
//        VStack(spacing: 15){
//
//            HStack(spacing: 10) {
//                WebImage(url: URL(string: post.user.pic)!)
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 50, height: 50)
//                    .clipShape(Circle())
//
//                Text(post.user.username)
//                    .foregroundColor(.white)
//                    .fontWeight(.bold)
//                Spacer(minLength: 0)
//
//                //displaying only posted user
//                if post.user.uid == uid{
//                    Menu(content: {
//                        Button(action: {postData.editPost(id: post.id)}) {
//                            Text("Edit")
//                        }
//
//                        Button(action: {postData.deletePost(id: post.id)}) {
//                            Text("Delete")
//                        }
//                    }, label: {
//                        Image(systemName: "ellipsis")
//                            .renderingMode(.template)
//                            .resizable()
//                            .rotationEffect(.degrees(90))
//                            .frame(width: 18, height: 18)
//                            .foregroundColor(.white)
//                    })
//                    .foregroundColor(.white)
//                }
//            }
//
//            if post.pic != "" {
//                WebImage(url: URL(string: post.pic)!)
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: UIScreen.main.bounds.width - 60, height: 250)
//                    .cornerRadius(15)
//            }
//
//            HStack{
//                Text(post.title)
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
//
//                Spacer(minLength: 0)
//            }
//            .padding(.top, 5)
//
//            HStack{
//                Spacer(minLength: 0)
//
//                Text(post.time, style: .time)
//                    .font(.caption)
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
//
//            }
//        }
//        .padding()
//        //.cornerRadius(15)
//    }
//}


struct PostRow: View {
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    
    var post: PostModel
    @ObservedObject var postData: PostViewModel
    let uid = Auth.auth().currentUser!.uid
    
    @State var liked = false
    
    //private let columns: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 0), count: 3)
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            
            HStack {
                Text("TITLE")
                    .font(.title)
                    .fontWeight(.heavy)
                    .padding(.trailing, 2)
                Text(" G:/")
                Text("target")
                Spacer()
                WebImage(url: URL(string: post.user.pic)!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30)
                    .clipShape(Circle())
            }
            
            HStack() {
                Text("by")
                Text(post.user.username)
                Text(" | ")
                Text(post.time, style: .date)
                
            }
            
            Text(post.title)
            
            HStack {
                LikedButton(isSet: liked)
                Spacer()
//                Image(systemName: "plus.bubble")
//                Spacer()
//                Image(systemName: "paperplane")
//                Spacer()
//                Image(systemName: "bookmark")
//                Spacer()
                Image(systemName: "tuningfork")
                Spacer()
                //displaying only posted user
                if post.user.uid == uid {
                    Menu(content: {
                        Button(action: {postData.editPost(id: post.id)}) {
                            Text("Edit")
                        }
                        
                        Button(action: {postData.deletePost(id: post.id)}) {
                            Text("Delete")
                        }
                    }, label: {
                        Image(systemName: "ellipsis")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .foregroundColor(.white)
                    })
                    .foregroundColor(.white)
                }
            }
        }
        .padding(.all, 5)
    }
}
