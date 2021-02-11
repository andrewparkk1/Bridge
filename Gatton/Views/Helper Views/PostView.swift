//
//  Post.swift
//  Gatton
//
//  Created by Andrew Park on 1/11/21.
//

import SwiftUI

struct PostView: View {
    var person: Person
    var postNum: Int
    var liked = false
    
//    private let columns: [GridItem] = [
//        GridItem(.fixed(100)),
//        GridItem()
//    ]
    

    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 20) {
                VStack {
                    Image(person.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25)
                        .clipShape(Circle())
                    
                    
                    Text(((person.posts?[postNum].ttime!)!))
                        .font(.caption2)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text(person.name)
                        
                        Text("@  G:/" + (person.posts?[postNum].target)!)
                            .font(.caption)
                        

                        
                    }
                    Text((person.posts?[postNum].description)!)
                    
                    HStack {
                        LikedButton(isSet: liked)
                        Spacer()
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "plus.bubble")
                                .foregroundColor(.black)
                        })
                        Spacer()
                        Image(systemName: "paperplane")
                        Spacer()
                        Image(systemName: "bookmark")
                    }
                    .padding(.trailing)
                    
                }
                
            }

        }
        .frame(alignment: .topLeading)
        .padding()
    }
}

struct Post_Previews: PreviewProvider {
    static var previews: some View {
        PostView(person: personTestData[0], postNum: 1)
    }
}
