//
//  AddPost.swift
//  Gatton
//
//  Created by Andrew Park on 2/1/21.
//

import SwiftUI

struct AddPost: View {
    var person: Person
    //var modelData: ModelData
    @State private var anonymous = false
    @State private var cancel = false
    @State private var posted = false
    @State private var text = ""
    @EnvironmentObject var modelData: ModelData
    
    
    var body: some View {
        VStack{
            PostBanner(anonymous: $anonymous, cancel: $cancel, posted: $posted, person: person)
                .padding(.top)
            
            Divider()
         
            
            
            //buttons for the target
            HStack{
                Image(person.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25)
                    .clipShape(Circle())
                
                TextField("type something...", text: $text)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding()
            
            Spacer()
        }
    }
}

struct AddPost_Previews: PreviewProvider {
    static var previews: some View {
        AddPost(person: personTestData[0])
    }
}
