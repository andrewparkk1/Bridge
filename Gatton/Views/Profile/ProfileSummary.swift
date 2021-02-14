//
//  Profile.swift
//  Gatton
//
//  Created by Andrew Park on 2/1/21.
//

import SwiftUI

struct ProfileSummary: View {
    @EnvironmentObject var modelData: ModelData
    var person: Person
    
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 3)

    private let rows: [GridItem] = [
        GridItem(.fixed(40), spacing: 0),
        GridItem(.fixed(40), spacing: 0)
    ]

    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    LazyHGrid(rows: rows) {
                        Text(person.name)
                        Text(String(person.year))
                    }
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    
                    VStack{
                        Image(person.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 140)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.black, lineWidth: 2))
                            .shadow(radius: 20)
                            .padding(.vertical)
                        
                        Text(person.description)
                    }
                    
                    
                    LazyHGrid(rows: rows) {
                        Text(person.city)
                        Text(person.state)
                    }
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                }
  
                LazyVStack {
                    ForEach(0..<person.posts!.count) { post in
                        PostView(person: person, postNum: post)
                    }
                    
                }
            }
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(person: personTestData[0])
            .environmentObject(ModelData())
    }
}
