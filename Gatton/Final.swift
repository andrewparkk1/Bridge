//
//  Banner.swift
//  Gatton
//
//  Created by Andrew Park on 1/10/21.
//

import SwiftUI

struct Final: View {
    @EnvironmentObject var modelData: ModelData
    @State var top = 1
    
    
    var body: some View {
        GeometryReader { geometry in
            TabView {
                
                // HOME
                NavigationView {
                    VStack {
                        Topbanner(top: $top)
                        Divider()
                        
                        GeometryReader { _ in
                            VStack {
                                if self.top == 0 {
                                    Search()
                                } else if self.top == 1 {
                                    Feed()
                                }
                            }
                        }
                    }
                    //.edgesIgnoringSafeArea(.top)
                    .navigationBarHidden(true)
                }
                .tabItem {
                    Image(systemName: "house.fill")
                }
                
                
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
                    
                }
                
                // POST
                NavigationView {
                    VStack {
                        AddPost(person: modelData.people[0])
                    }
                    .navigationBarHidden(true)
                }
                .tabItem {
                    Image(systemName: "plus.app")
                    
                }
                
                // GROUP
                NavigationView {
                    VStack {
                        
                    }
                }
                .tabItem { Image(systemName: "person.3.fill") }
                
                
                // PROFILE
                NavigationView {
                    VStack {
                        ProfileView(person: modelData.people[0])
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
