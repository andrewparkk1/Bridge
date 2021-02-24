//
//  CustomTabbar.swift
//  Gatton
//
//  Created by Andrew Park on 2/16/21.
//

//CHECKED

import SwiftUI

struct CustomTabbar: View {
    @Binding var selectedTab: String
    var body: some View {
        HStack() {
            TabButton(title: "Posts", selectedTab: $selectedTab)
//            TabButton(title: "Settings", selectedTab: $selectedTab)
            TabButton(title: "Profile", selectedTab: $selectedTab)
            

        }
        .padding(.horizontal)
        .background(Color.white)
        .clipShape(Capsule())
    }
}

struct TabButton: View{
    var title: String
    @Binding var selectedTab: String
    var body: some View{
        Button(action: {selectedTab = title}, label: {
            VStack(){
//                Image(title)
//                    .renderingMode(.template)
                
                Text(title)
                    .font(.caption)
                    .fontWeight(.bold)
            }
            .foregroundColor(selectedTab == title ? .blue : .gray)
            .padding(.horizontal)
            .padding(.vertical, 10)
        })
    }
}

struct CustomTabbar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabbar(selectedTab: .constant("Profile"))
    }
}
