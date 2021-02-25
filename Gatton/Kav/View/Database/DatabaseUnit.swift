//
//  DatabaseUnit.swift
//  Gatton
//
//  Created by Andrew Park on 1/30/21.
//

import SwiftUI

struct DatabaseUnit: View {
    var person: UserModel
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                //.background(Color(UIColor.secondarySystemBackground))
                .foregroundColor(person.year == 2022 || person.year == 2021 ? .green : Color(UIColor.lightGray))
                .frame(width: 180, height: 180)
                .clipped()
            
            Image(person.pic)
                .resizable()
                .frame(width: 110, height: 110, alignment: .center)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .shadow(radius: 7)
                .offset(x: 0, y: -80.0)
            
            VStack {
                Text(person.username)
                    .font(Font.custom("Avenir Next Condensed", size: 30)).bold()
                    //.font(Font.custom("ヒラギノ角ゴシック W5", size: 20))
                Text(String(person.year))
                    .font(Font.custom("Avenir", size: 20))
                Text(person.city + ", " + person.state)
                    .font(Font.custom("Avenir", size: 20))
            }
            .frame(maxWidth: 180, maxHeight: 30, alignment: .center)
            .fixedSize(horizontal: true, vertical: true)
            .lineLimit(1)
            .allowsTightening(true)
            .offset(x: 0, y: 30)
        }
        .padding(.top, 60.0)
//        .padding(.leading, 25)
//        .padding(.trailing, 25)

    }
}

