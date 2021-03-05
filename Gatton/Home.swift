//
//  Home.swift
//  Gatton
//
//  Created by Andrew Park on 2/16/21.
//

//checked

import SwiftUI

struct Home: View {
    @State var selectedTab = "house.fill"
    @StateObject var set = SettingsViewModel()
    @State var color = Color(.red)
    
    @StateObject var postData = PostViewModel()
    
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            
            ZStack{
                PostView()
                    .opacity(selectedTab == "house.fill" ? 1 : 0)
                
                SearchTarget(color: $color)
                    .opacity(selectedTab == "magnifyingglass" ? 1 : 0)
                
                Text("Post")
                    .opacity(selectedTab == "pencil.circle" ? 1 : 0)
                
                Database()
                    .opacity(selectedTab == "network" ? 1 : 0)
                
                Main()
                    .opacity(selectedTab == "person" ? 1 : 0)
                

                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            CustomTabbar(selectedTab: $selectedTab)
                .padding(.horizontal)
            
        }
        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
        .ignoresSafeArea(.all, edges: .top)
    }
}


struct CustomTabbar: View {
    @Binding var selectedTab: String

    var body: some View {
        HStack(spacing: 10) {
            TabButton(image: "house.fill", selectedTab: $selectedTab)
            
            TabButton(image: "magnifyingglass", selectedTab: $selectedTab)
            
            TabButton(image: "pencil.circle", selectedTab: $selectedTab)

            TabButton(image: "network", selectedTab: $selectedTab)
            
            TabButton(image: "person", selectedTab: $selectedTab)
            
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
        .background(Color(.black).ignoresSafeArea(.all, edges: .all))
        .clipShape(Capsule())
    }
}

struct TabButton: View{
    @StateObject var postData = PostViewModel()
    var image: String
    @Binding var selectedTab: String
    var body: some View{
        Button(action: {
            if image == "pencil.circle" {
                postData.newPost.toggle()
            }
            selectedTab = image
        }, label: {
            Image(systemName: image)
                .font(.title2)
                .foregroundColor(selectedTab == image ? .blue: .white)
                .padding(.horizontal)
                .padding(.vertical, 7)
        })
        .fullScreenCover(isPresented: $postData.newPost, content: {
            NewPostTab(updateId: $postData.updateId, selectedTab: $selectedTab)
        })
    }
}


//
//struct a: View {
//    @State var selectedTab = "Posts"
//    var edges = UIApplication.shared.windows.first?.safeAreaInsets
//    @StateObject var postData = PostViewModel()
//    @State var posting = false
//
//    //    init() {
//    //        UITabBar.appearance().isHidden = true
//    //    }
//
//    var body: some View {
//        TabView(selection: $selectedTab) {
//            PostView()
//                .tag("house.fill")
//
//            Database()
//                .tag("network")
//
//            NewPost(updateId: $postData.updateId, selectedTab: $selectedTab)
//                .tag("pencil.circle")
//
//            ProfileView(selectedTab: $selectedTab)
//                .tag("person")
//
//        }
//        .overlay (
//            VStack(spacing: 12) {
//                Divider()
//                    .padding(.horizontal, -15)
//
//                HStack {
//                    TabBarButton(image: "house.fill", selectedTab: $selectedTab)
//                        .frame(maxWidth: .infinity)
//                    TabBarButton(image: "network", selectedTab: $selectedTab)
//                        .frame(maxWidth: .infinity)
//                    TabBarButton(image: "pencil.circle", selectedTab: $selectedTab)
//                        .frame(maxWidth: .infinity)
//                    TabBarButton(image: "person", selectedTab: $selectedTab)
//                        .frame(maxWidth: .infinity)
//
//                }
//            }
//            ,alignment: .bottom
//        )
//        .padding(.bottom, edges!.bottom == 0 ? 15: 0)
//        .background(Color("bg")).ignoresSafeArea(.all, edges: .all)
//        .ignoresSafeArea(.all, edges: .top)
//    }
//}
//
//
//
//struct TabBarButton: View {
//    var image: String
//    @Binding var selectedTab: String
//    var body: some View {
//        Button(action: {
//            selectedTab = image
//        }, label: {
//            Image(systemName: image)
//                .font(.title2)
//                .foregroundColor(selectedTab == image ? .primary: .gray)
//
//        })
//
//    }
//}


//
//struct da: View {
//    var edges = UIApplication.shared.windows.first?.safeAreaInsets
//
//    @State private var selectedTab = 1
//    @StateObject var postData = PostViewModel()
//
//    var body: some View {
//        TabView(selection: $selectedTab) {
//            // HOME
//            PostView()
//                .tabItem { Image(systemName: "house.fill") }
//                .tag(1)
//
//
//            // NETWORK
//
//            Database()
//                .tabItem { Image(systemName: "network")}
//                .tag(2)
//
//
//            // POST
//            NewPost(updateId: $postData.updateId, selectedTab: $selectedTab)
//                .tabItem { Image(systemName: "pencil.circle")}
//                .tag(3)
//
//            //
//            //                // GROUP
//            //                NavigationView {
//            //                    VStack {
//            //
//            //                    }
//            //                }
//            //                .tabItem { Image(systemName: "person.3.fill") }
//            //
//
//            // PROFILE
//            ProfileView(selectedTab: $selectedTab)
//                .tabItem { Image(systemName: "person") }
//                .tag(4)
//
//        }
//        .padding(.top, edges!.top)
//    }
//
//}
