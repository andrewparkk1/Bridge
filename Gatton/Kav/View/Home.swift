//
//  Home.swift
//  Gatton
//
//  Created by Andrew Park on 2/16/21.
//

import SwiftUI

struct Home: View {
    @State var selectedTab = "Posts"
    var edges = UIApplication.shared.windows.first?.safeAreaInsets

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            
            ZStack{
                PostView()
                    .opacity(selectedTab == "Posts" ? 1 : 0)
                
                SettingsView()
                    .opacity(selectedTab == "Settings" ? 1 : 0)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            CustomTabbar(selectedTab: $selectedTab)
                .padding(.bottom, edges!.bottom == 0 ? 15:0)
            
        }
        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
        .ignoresSafeArea(.all, edges: .top)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}