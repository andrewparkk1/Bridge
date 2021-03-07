//
//  Search.swift
//  Gatton
//
//  Created by Andrew Park on 2/26/21.
//

import SwiftUI

struct SearchTarget: View {
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @StateObject var postData = PostViewModel()
    @Binding var color: Color
    
    var body: some View {
        VStack {
            HStack{
                Text("Search")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                Spacer(minLength: 0)
            }
            .padding()
            .padding(.top, edges!.top)
            .background(Color("bg"))
            .shadow(color: Color.white.opacity(0.06), radius: 5, x: 0, y: 5)

            ScrollView {
                NavigationLink(destination: TargetPostView(target: "Professors", color: Color(.red))) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.red)
                            .frame(height: (UIScreen.main.bounds.size.height/7) + 5)
                        Text("Professors")
                            .foregroundColor(.white)
                    }
                }
                .navigationBarHidden(true)
                
                
                NavigationLink(destination: TargetPostView(target: "Classes", color: Color(.blue))) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.blue)
                            .frame(height: (UIScreen.main.bounds.size.height/7) + 5)

                        Text("Classes")
                            .foregroundColor(.white)
                        
                    }
                }
                .navigationBarHidden(true)
                
                
                NavigationLink(destination: TargetPostView(target: "Research", color: Color(.green))) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.green)
                            .frame(height: (UIScreen.main.bounds.size.height/7) + 5)
                        Text("Research")
                            .foregroundColor(.white)
                        
                    }
                    
                }
                .navigationBarHidden(true)
                
                
                NavigationLink(destination: TargetPostView(target: "QandA", color: Color(.yellow))) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.yellow)
                            .frame(height: (UIScreen.main.bounds.size.height/7) + 5)
                        Text("Q and A")
                            .foregroundColor(.white)
                        
                    }
                    
                }
                .navigationBarHidden(true)
                
                
                NavigationLink(destination: TargetPostView(target: "Colleges", color: Color(.purple))) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.purple)
                            .frame(height: (UIScreen.main.bounds.size.height/7) + 5)
                        Text("Colleges")
                            .foregroundColor(.white)
                        
                    }
                    
                }
                .navigationBarHidden(true)
                
                
            }
            .ignoresSafeArea()
            
            
            
            //            NavigationLink(destination: TargetPostView(target: "Connect")) {
            //                ZStack {
            //                    Rectangle()
            //                        .foregroundColor(.gray)
            //                    Text("connect")
            //                }
            //            }
            //            .navigationBarHidden(true)
            
        }
    }
}


