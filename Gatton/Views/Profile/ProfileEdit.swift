//
//  ProfileEdit.swift
//  Gatton
//
//  Created by Andrew Park on 2/11/21.
//

import SwiftUI

struct ProfileEdit: View {
    @Binding var person: Person
    @State var isPresented = false
    
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 3)

    private let rows: [GridItem] = [
        GridItem(.fixed(40), spacing: 0),
        GridItem(.fixed(40), spacing: 0)
    ]

    var body: some View {
        
        LazyVGrid(
            columns: columns,
            alignment: .center,
            spacing: 0
        ) {
            LazyHGrid(rows: rows) {
                TextField("Name", text: $person.name)
                Button(action: {
                    isPresented.toggle()
                }) {
                    Text(String(person.year))
                }
                .sheet(isPresented: $isPresented, content: {
                    Picker(selection: $person.year, label: Text("Year")) {
                        ForEach(1990 ..< 2022) { num in
                            Text(String(num))
                        }
                    }
                })
            }
            .padding(.horizontal)
            
            VStack {
                Image(person.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 140)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.black, lineWidth: 2))
                    .shadow(radius: 20)
                    .padding(.vertical)
                
                TextField("Description", text: $person.description)
            }
            
            LazyHGrid(
                rows: rows
            ) {
                TextField("City", text: $person.city)
                TextField("State", text: $person.state)
            }
            .padding(.horizontal)

        }
        .multilineTextAlignment(.center)
    }
}


struct ProfileEdit_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEdit(person: .constant(personTestData[0]))
    }
}
