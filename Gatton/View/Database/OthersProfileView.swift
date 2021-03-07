//
//  OthersProfileView.swift
//  Gatton
//
//  Created by Andrew Park on 3/6/21.
//


import SDWebImageSwiftUI
import SwiftUI
import Firebase


struct OthersProfileView: View {
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @StateObject var profileData = ProfileViewModel()
    @StateObject var postData = PostViewModel()
    var user: UserModel
    
    
    private var personalPosts: [PostModel] {
        postData.posts.filter { post in
            post.user.id == user.id
        }
    }
    
    
    
    var body: some View {
        VStack{
            //BANNER
            HStack{
                Text("Profile")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
            }
            .padding()
            .padding(.top, edges!.top)
            .background(Color("bg"))
            .shadow(color: Color.white.opacity(0.06), radius: 5, x: 0, y: 5)
            
            HStack {
                VStack() {
                    Text(user.username)
                    Text(String(user.year))
                }
                .padding(.horizontal, 1)
                .multilineTextAlignment(.center)
                
                if user.pic != "" {
                    ZStack{
                        WebImage(url: URL(string: user.pic)!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 125, height: 125)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                            .shadow(radius: 20)
                            .padding(.vertical)
                            .padding(.horizontal, 1)
                        
//                        if profileData.isLoading {
//                            ProgressView()
//                                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
//                        }
                    }
                    .padding(.horizontal, 3)
                }
                
                VStack() {
                    Text(user.city)
                    Text(user.state)
                }
                .padding(.horizontal, 1)
                .multilineTextAlignment(.center)
            }
            
            Text(user.bio)
                .padding(.top, 2)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            
            Text(user.interests)
                .padding(.top, 2)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            
            
            Divider()
            
            ScrollView {
                VStack(spacing: 15) {
                    ForEach(personalPosts) { post in
                        PostRow(post: post, postData: postData)
                        Divider()
                    }
                }
                .padding()
                .padding(.bottom, 55)
            }
            
        }
    }
}








//import SwiftUI
//import SDWebImageSwiftUI
//
//struct ProfileView: View {
//    var edges = UIApplication.shared.windows.first?.safeAreaInsets
//    @StateObject var settingsData = SettingsViewModel()
//
//    private let columns = Array(repeating: GridItem(.flexible(), spacing: 3), count: 3)
//
//    private let rows: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 3), count: 2)
//
//
//    var body: some View {
//        VStack {
//            //BANNER
//            HStack{
//                Text("Profile")
//                    .font(.largeTitle)
//                    .fontWeight(.heavy)
//                    .foregroundColor(.white)
//                Spacer(minLength: 0)
//            }
//            .padding()
//            .padding(.top, edges!.top)
//            .background(Color("bg"))
//            .shadow(color: Color.white.opacity(0.06), radius: 5, x: 0, y: 5)
//
//            HStack {
//                LazyHGrid(rows: rows) {
//                    Text(settingsData.userInfo.username)
//                    Text("asdf")
//                    //                        Text(String(settingsData.userInfo.year))
//                    //                            .font(.title)
//                    //                            .fontWeight(.bold)
//                    //                            .foregroundColor(.white)
//                }
//                .padding()
//                .padding(.leading, edges!.left)
//                .multilineTextAlignment(.center)
//
//                if settingsData.userInfo.pic != "" {
//                    ZStack{
//                        WebImage(url: URL(string: settingsData.userInfo.pic)!)
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 140)
//                            .clipShape(Circle())
//                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
//                            .shadow(radius: 20)
//                            .padding(.vertical)
//
//                        if settingsData.isLoading {
//                            ProgressView()
//                                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
//                        }
//                    }
//                    .padding()
//                }
//
//
//                LazyHGrid(rows: rows) {
//                    Text("person.city")
//                    Text("person.state")
//                }
//                .padding()
//                .padding(.trailing, edges!.right)
//                .multilineTextAlignment(.center)
//            }
//            Text(settingsData.userInfo.bio)
//                .padding(.top, 10)
//                .foregroundColor(.white)
//                .multilineTextAlignment(.center)
//        }
//        .padding()
//    }
//
//}
//

