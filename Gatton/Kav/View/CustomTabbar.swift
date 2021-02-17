//
//  CustomTabbar.swift
//  Gatton
//
//  Created by Andrew Park on 2/16/21.
//

import SwiftUI

struct CustomTabbar: View {
    @Binding var selectedTab: String
    var body: some View {
        HStack(spacing: 65) {
            TabButton(title: "Posts", selectedTab: $selectedTab)
            TabButton(title: "Settings", selectedTab: $selectedTab)

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
        Button(action: {}, label: {
            VStack(spacing: 5){
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
        CustomTabbar(selectedTab: .constant("Settings"))
    }
}
