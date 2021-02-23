////
////  ProfileView.swift
////  Gatton
////
////  Created by Andrew Park on 2/21/21.
////
//

//WITHOUT GRIDS


import SwiftUI
import SDWebImageSwiftUI

struct ProfileView: View {
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @StateObject var profileData = ProfileViewModel()
    
    
    var body: some View {
        VStack{
            
            Button(action: profileData.userInfo.switchEdit) {
                Text("Edit")
            }
            
            //BANNER
            HStack{
                Text("Profile")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                Spacer(minLength: 0)
            }
            .padding()
            .padding(.top, edges!.top)
            .background(Color("bg"))
            .shadow(color: Color.white.opacity(0.06), radius: 5, x: 0, y: 5)
            
            HStack {
                VStack() {
                    Text(profileData.userInfo.username)
                    Text("2022")
                    //                        Text(String(settingsData.userInfo.year))
                    //                            .font(.title)
                    //                            .fontWeight(.bold)
                    //                            .foregroundColor(.white)
                }
                .padding(.leading, 1)
                .multilineTextAlignment(.center)
                
                if profileData.userInfo.pic != "" {
                    ZStack{
                        WebImage(url: URL(string: profileData.userInfo.pic)!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 125, height: 125)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                            .shadow(radius: 20)
                            .padding(.vertical)
                        
                        if profileData.isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                        }
                    }
                }
                
                
                VStack() {
                    Text(profileData.userInfo.city)
                    Text(profileData.userInfo.state)
                }
                .padding(.trailing, 1)
                .multilineTextAlignment(.center)
            }
            Text(profileData.userInfo.bio)
                .padding(.top, 2)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            
            Text(profileData.userInfo.interests)
                .padding(.top, 2)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            
            Spacer(minLength: 0)
        }
        .padding()
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

