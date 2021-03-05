////
////  Home.swift
////  Gatton
////
////  Created by Andrew Park on 2/14/21.
////
//
//import SwiftUI
//
//struct MyHome: View {
//    @State var top = 1
//    
//    var body: some View {
//        VStack {
//            Topbanner(top: $top)
//            Divider()
//            
//            VStack {
//                if self.top == 0 {
//                    Search()
//                } else if self.top == 1 {
//                    Feed()
//                }
//            }
//            
//        }
//        //        .tabItem {
//        //            Image(systemName: "house.fill")
//        //        }
//        
//        
//    }
//}
//
//struct MyHome_Previews: PreviewProvider {
//    static var previews: some View {
//        MyHome(top: 1)
//    }
//}
