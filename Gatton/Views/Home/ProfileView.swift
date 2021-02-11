//
//  Profile.swift
//  Gatton
//
//  Created by Andrew Park on 2/1/21.
//

import SwiftUI

struct ProfileView: View {
    var person: Person
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text(person.name)
                    Text(String(person.year))
                  
                }
                Image(person.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.black, lineWidth: 2))
                    .shadow(radius: 20)
                
                VStack {
                    Text(person.description)
                    Text(person.city + ", " + person.state)   
                }
                
            }
            
            ScrollView {
                ForEach(0..<person.posts!.count) { post in
                    PostView(person: person, postNum: post)
                }
                
            }
            
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(person: personTestData[0])
    }
}
