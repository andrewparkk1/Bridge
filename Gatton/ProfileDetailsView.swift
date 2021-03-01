//////
//////  ProfileView.swift
//////  Gatton
//////
//////  Created by Andrew Park on 2/21/21.
//////
////
//
////WITHOUT GRIDS
//
////my draft
//
//import SDWebImageSwiftUI
//import SwiftUI
//import Firebase
//
//
//struct ProfileDetailsView: View {
//    var edges = UIApplication.shared.windows.first?.safeAreaInsets
//
//    @StateObject var profileData = ProfileEditViewModel()
//    @StateObject var postData = PostViewModel()
//    let uid = Auth.auth().currentUser!.uid
//    private var personalPosts: [PostModel] {
//        postData.posts.filter { post in
//            post.user.id == uid
//        }
//    }
//
//    @Environment(\.presentationMode) var presentationMode
//    @State var presentEditUserSheet = false
//
//
//    private func editButton(action: @escaping () -> Void) -> some View {
//        Button(action: { action() }) {
//            Text("Edit")
//        }
//    }
//
//
//    var body: some View {
//        NavigationView {
//
//            VStack{
//                HStack {
//                    VStack() {
//                        Text(profileData.user.username)
//                        Text(String(profileData.user.year))
//                    }
//                    .padding(.horizontal, 1)
//                    .multilineTextAlignment(.center)
//
//                    if profileData.user.pic != "" {
//                        ZStack{
//                            WebImage(url: URL(string: profileData.user.pic)!)
//                                .resizable()
//                                .aspectRatio(contentMode: .fill)
//                                .frame(width: 125, height: 125)
//                                .clipShape(Circle())
//                                .overlay(Circle().stroke(Color.white, lineWidth: 2))
//                                .shadow(radius: 20)
//                                .padding(.vertical)
//                                .padding(.horizontal, 1)
//
//                            if profileData.isLoading {
//                                ProgressView()
//                                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
//                            }
//                        }
//                    }
//
//
//                    VStack() {
//                        Text(profileData.user.city)
//                        Text(profileData.user.state)
//                    }
//                    .padding(.horizontal, 1)
//                    .multilineTextAlignment(.center)
//                }
//
//                Text(profileData.user.bio)
//                    .padding(.top, 2)
//                    .foregroundColor(.white)
//                    .multilineTextAlignment(.center)
//
//                Text(profileData.user.interests)
//                    .padding(.top, 2)
//                    .foregroundColor(.white)
//                    .multilineTextAlignment(.center)
//                Divider()
//                ScrollView {
//                    VStack(spacing: 15) {
//                        ForEach(personalPosts) { post in
//                            PostRow(post: post, postData: postData)
//                            Divider()
//                        }
//                    }
//                    .padding()
//                    .padding(.bottom, 55)
//                }
//                Spacer()
//
//            }
//            .background(Color("bg").ignoresSafeArea(.all, edges: .all))
//            .navigationBarItems(trailing: editButton {
//                self.presentEditUserSheet.toggle()
//            })
//        }
//        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
//        .sheet(isPresented: self.$presentEditUserSheet) {
//            ProfileEditView(viewModel: ProfileEditViewModel()) { result in
//                if case .success(let action) = result, action == .delete {
//                    self.presentationMode.wrappedValue.dismiss()
//                }
//            }
//        }
//
//        //        .fullScreenCover(isPresented: $postData.newPost, content: {
//        //            NewPost(updateId: $postData.updateId)
//        //        })
//    }
//}
//
//
//
//
//
//
//
//
////import SwiftUI
////import SDWebImageSwiftUI
////
////struct ProfileView: View {
////    var edges = UIApplication.shared.windows.first?.safeAreaInsets
////    @StateObject var settingsData = SettingsViewModel()
////
////    private let columns = Array(repeating: GridItem(.flexible(), spacing: 3), count: 3)
////
////    private let rows: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 3), count: 2)
////
////
////    var body: some View {
////        VStack {
////            //BANNER
////            HStack{
////                Text("Profile")
////                    .font(.largeTitle)
////                    .fontWeight(.heavy)
////                    .foregroundColor(.white)
////                Spacer(minLength: 0)
////            }
////            .padding()
////            .padding(.top, edges!.top)
////            .background(Color("bg"))
////            .shadow(color: Color.white.opacity(0.06), radius: 5, x: 0, y: 5)
////
////            HStack {
////                LazyHGrid(rows: rows) {
////                    Text(settingsData.user.username)
////                    Text("asdf")
////                    //                        Text(String(settingsData.user.year))
////                    //                            .font(.title)
////                    //                            .fontWeight(.bold)
////                    //                            .foregroundColor(.white)
////                }
////                .padding()
////                .padding(.leading, edges!.left)
////                .multilineTextAlignment(.center)
////
////                if settingsData.user.pic != "" {
////                    ZStack{
////                        WebImage(url: URL(string: settingsData.user.pic)!)
////                            .resizable()
////                            .aspectRatio(contentMode: .fit)
////                            .frame(width: 140)
////                            .clipShape(Circle())
////                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
////                            .shadow(radius: 20)
////                            .padding(.vertical)
////
////                        if settingsData.isLoading {
////                            ProgressView()
////                                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
////                        }
////                    }
////                    .padding()
////                }
////
////
////                LazyHGrid(rows: rows) {
////                    Text("person.city")
////                    Text("person.state")
////                }
////                .padding()
////                .padding(.trailing, edges!.right)
////                .multilineTextAlignment(.center)
////            }
////            Text(settingsData.user.bio)
////                .padding(.top, 10)
////                .foregroundColor(.white)
////                .multilineTextAlignment(.center)
////        }
////        .padding()
////    }
////
////}
////
//
//
//
////            //BANNER
////            HStack{
////                Text("Profile")
////                    .font(.largeTitle)
////                    .fontWeight(.heavy)
////                    .foregroundColor(.white)
////                Spacer(minLength: 0)
////                    NavigationLink(
////                        destination: SettingsView(),
////                        label: {
////                            Text("Edit")
////                                .fontWeight(.bold)
////                                .foregroundColor(.white)
////                        })
////                        .navigationBarHidden(true)
////            }
////            .padding()
////            .padding(.top, edges!.top)
////            .background(Color("bg"))
////            .shadow(color: Color.white.opacity(0.06), radius: 5, x: 0, y: 5)
////
