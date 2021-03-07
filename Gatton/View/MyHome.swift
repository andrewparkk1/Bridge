////
////  Home.swift
////  Gatton
////
////  Created by Andrew Park on 2/14/21.
////

import SwiftUI

struct MyHome: View {
    @State var top = 1
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @StateObject var postData = PostViewModel()
    
    
    var body: some View {
        VStack {
            HStack {
                Topbanner(top: $top)
            }
            .padding()
            .padding(.top, edges!.top)
            .background(Color("bg"))
            .shadow(color: Color.white.opacity(0.06), radius: 5, x: 0, y: 5)
            
            ZStack {
                if self.top == 0 {
                    CreativePosts()
                } else if self.top == 1 {
                    PostView()
                }
            }
            Spacer()
            
        }

    }
}

//struct MyHome_Previews: PreviewProvider {
//    static var previews: some View {
//        MyHome(top: 1)
//    }
//}
