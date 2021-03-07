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
    @State var selectedTab: String = "house.fill"
    
    var body: some View {
        VStack {
            HStack {
                Topbanner(top: $top, selectedTab: $selectedTab)
            }
            .padding()
            .padding(.top, edges!.top)
            .background(Color("bg"))
            .shadow(color: Color.white.opacity(0.06), radius: 5, x: 0, y: 5)
            
            ZStack {
                if self.top == 0 {
                    NavigationView {
                        PostView(top: $top)
                            .navigationBarHidden(true)
                    }
                    .highPriorityGesture(
                        DragGesture().onEnded({
                            self.handleSwipe(translation: $0.translation.width)
                        }))
                } else if self.top == 1 {
                    NavigationView {
                        PostView(top: $top)
                            .navigationBarHidden(true)
                    }
                    .highPriorityGesture(
                        DragGesture().onEnded({
                            self.handleSwipe(translation: $0.translation.width)
                        }))
                }
            }
            Spacer()
            
        }
        
    }
    
    private func handleSwipe(translation: CGFloat) {
        if translation > 50 && top == 1 {
            top = 0
        } else  if translation < -50 && top == 0 {
            top = 1
        }
    }
}

//struct MyHome_Previews: PreviewProvider {
//    static var previews: some View {
//        MyHome(top: 1)
//    }
//}
