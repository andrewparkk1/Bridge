//
//  AddPost.swift
//  Gatton
//
//  Created by Andrew Park on 2/1/21.
//

import SwiftUI

struct AddPost: View {
    var person: Person
    @EnvironmentObject var modelData: ModelData
    
    @State private var title = ""
    @State private var description = ""
    @State private var isPresented = false
    
    @State private var anonymous = false
    @State private var posted = false
    @State private var cancel = false
    @Binding var selectedTab: Int
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 12){
            HStack{
                Image(systemName: "xmark")
                    .foregroundColor(.gray)
                    .onTapGesture {
                        cancel.toggle()
                        selectedTab = 1
                        title = ""
                        description = ""
                    } 
                
                Spacer()
                
                
                Text(anonymous ? "Anonymous" : person.name)
                    .foregroundColor(anonymous ? .gray : .green)
                    .onTapGesture {
                        anonymous.toggle()
                    }
                
                Spacer()
                
                Button(action: {
                    self.posted = true
                }, label: {
                    Text("Post")
                })

            }
                .padding(.horizontal)
            
            Divider()
            
            HStack {
                TextField("title?", text: $title)
                    .font(Font.system(size: 25, weight: .heavy, design: .serif))
                Spacer()
                Image(person.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30)
                    .clipShape(Circle())
            }
            .padding(.trailing)
            
            
            HStack{
                Text("by")
                Text(person.name)
                Text(" | ")
                Text("Time")
                Text(" |  G:/")
                //                Button(action: {
                //                    a.toggle()
                //                }) {
                //                    Text(String(person.year))
                //                }
                //                .sheet(isPresented: $isPresented, content: {
                //                    Picker(selection: Post.target, label: Text("general")) {
                //                        ForEach(Post.target) { target in
                //                            Text(Post.target))
                //                        }
                //                    }
                //                })
            }
            
            
            TextField("type something...", text: $description)
                .font(Font.system(size: 15, weight: .medium, design: .serif))
            
            
            Spacer()
        }.padding()
    }
    
}

struct AddPost_Previews: PreviewProvider {
    static var previews: some View {
        AddPost(person: personTestData[0], selectedTab: .constant(1))
    }
}


