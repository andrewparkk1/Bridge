//
//  Main.swift
//  Gatton
//
//  Created by Andrew Park on 3/5/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct Main: View {
    @State var offset: CGFloat = 0
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @State var top = 1

    
    var body: some View {
        GeometryReader{ proxy in
            
            let rect = proxy.frame(in: .global)
            
//            ZStack(){
//
//                VStack {
//
//                    HStack{
//                        Text(" ")
//                    }
//                    .padding()
//                    .padding(.top, edges!.top)
//                    .background(Color("bg"))
//                    .shadow(color: Color.white.opacity(0.06), radius: 5, x: 0, y: 5)
//
                    
                    
                    ScrollableTabBar(tabs: tabs, rect: rect, offset: $offset) {
                        HStack(spacing: 0) {
                            ForEach(0..<2) { index in
                                if index == 1{
                                    PostView(top: $top)
                                        .padding()
                                        .frame(width: rect.width, height: rect.height)
                                        .cornerRadius(0)
                                        .ignoresSafeArea()

                                } else {
                                    PostView(top: $top)
                                        .padding()
                                        .frame(width: rect.width, height: rect.height)
                                        .cornerRadius(0)

                                }
                            }
                        }
                        .ignoresSafeArea()
                    }
                }
                .ignoresSafeArea()
                .overlay(
                    TabBar(offset: $offset)
                        .padding(.top, edges!.top)
                    , alignment: .top
                )

            }
        }        
//    }
//}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}

var tabs = ["Creative", "Feed"]
