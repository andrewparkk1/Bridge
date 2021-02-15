//
//  Banner.swift
//  Gatton
//
//  Created by Andrew Park on 1/10/21.
//

import SwiftUI

struct Final: View {
    @EnvironmentObject var modelData: ModelData
    @State private var selectedTab = 1
    @State var anonymous = false
    @State var posted = false
    
    
    var body: some View {
        GeometryReader { geometry in
            TabView(selection: $selectedTab) {
                
                // HOME
                Home()
                    .tabItem {
                        Image(systemName: "house.fill")
                    }.tag(1)
                
                
                // NETWORK
                NavigationView {
                    GeometryReader { _ in
                        VStack {
                            Divider()
                            Database()
                        }
                    }
                    .navigationBarTitle(Text("Students"))
                    .navigationBarHidden(false)
                }
                .tabItem {
                    Image(systemName: "network")
                }.tag(2)
                
                // POST
                
                AddPost(person: modelData.people[0], anonymous: $anonymous, posted: $posted)
                    .tabItem {
                        Image(systemName: "pencil.circle")
                    }
                
            //                VStack{
            //                    Text("asdf")
            //                    Text("andrew")
            //                }
            //                .onTapGesture{
            //                    self.selectedTab = 1
            //                }
            //                .tabItem {
            //                    Image(systemName: "pencil.circle")
            //                }.tag(3)
            //
            //                Text("Tab 1")
            //                    .onTapGesture {
            //                        self.selectedTab = 1
            //                    }
            //                    .tabItem {
            //                        Image(systemName: "star")
            //                        Text("One")
            //                    }
            //                    .tag(0)
            //
            //                Text("ohohoho")
            
            
            
            // GROUP
            NavigationView {
                VStack {
                    
                }
            }
            .tabItem { Image(systemName: "person.3.fill") }
            
            
            // PROFILE
            NavigationView {
                VStack {
                    ProfileHost()
                }
                .navigationBarHidden(true)
            }
            .tabItem { Image(systemName: "person") }
            
        }
        .ignoresSafeArea()
    }
}
}

struct Final_Previews: PreviewProvider {
    static var previews: some View {
        Final().environmentObject(ModelData())
    }
}
