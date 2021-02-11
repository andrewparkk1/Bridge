//
//  PostBanner.swift
//  Gatton
//
//  Created by Andrew Park on 2/1/21.
//

import SwiftUI

struct PostBanner: View {
    @Binding var anonymous: Bool
    @Binding var cancel: Bool
    @Binding var posted: Bool
    var person: Person
    
    var body: some View {
        HStack{
            Button(action: {
                self.cancel = true
            }, label: {
                Image(systemName: "xmark")
                    .foregroundColor(.gray)
            }).padding(.leading)
            
            Spacer()
            
            
            Text(anonymous ? "Anonymous" : person.name)
                .foregroundColor(self.anonymous ? .gray : .green)
                .onTapGesture {
                    self.anonymous.toggle()
                }
            
            Spacer()
            
            Button(action: {
                self.posted = true
            }, label: {
                Text("Post")
            }).padding(.trailing)

        }
        
        
    }
}

struct PostBanner_Previews: PreviewProvider {
    static var previews: some View {
        PostBanner(anonymous: .constant(false), cancel: .constant(false), posted: .constant(false), person: personTestData[0])
    }
}


//NavigationView {
//    Text(anonymous ? "anonymous" : person.name)
//        .onTapGesture {
//            self.anonymous.toggle()
//        }
//        .navigationBarItems(leading:
//                                    Button(action: {
//                                        self.cancel = true
//                                    }, label: {
//                                        Image(systemName: "xmark")
//                                            .foregroundColor(.gray)
//
//                                    }),
//                            trailing:
//                                    Button(action: {
//                                        self.posted = true
//                                    }, label: {
//                                        Text("Post")
//                                    })
//
//                                )
//        }
