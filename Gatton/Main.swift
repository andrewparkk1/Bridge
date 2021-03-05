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
    var body: some View {
        GeometryReader{ proxy in
            
            let rect = proxy.frame(in: .global)
            
            ScrollableTabBar(tabs: tabs, rect: proxy.frame(in: .global), offset: $offset) {
                HStack(spacing: 0) {
                    ForEach(image_URLs.indices, id: \.self) { index in
                        WebImage(url: URL(string: image_URLs[index]))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: rect.width)
                            .cornerRadius(0)
                            .overlay(Color.black.opacity(0.3))
                        
                    }
                }
                .ignoresSafeArea()
            }
            
        }
        .ignoresSafeArea()
        .overlay(
            TabBar(offset: $offset),alignment: .top
        )

    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}

var tabs = ["Creative", "Feed"]
