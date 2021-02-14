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
    
    private let columns: [GridItem] = [
        GridItem(.fixed(50), spacing: 5, alignment: .leading),
        GridItem(.fixed(100), alignment: .leading)
    ]
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
            
            HStack {
                Text((person.posts?[postNum].title)!)
                    .font(.title)
                    .fontWeight(.heavy)
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
                Text((person.posts?[postNum].ttime!)!)
                Text(" |  G:/")
                Text((person.posts?[postNum].target)!)
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
                Spacer()
                Image(systemName: "tuningfork")
            }
            .padding(.horizontal)
        }.padding()
        
    }
}

struct Post_Previews: PreviewProvider {
    static var previews: some View {
        PostView(person: personTestData[0], postNum: 1)
    }
}


//GeometryReader { gp in
//    HStack {
//        VStack {
//            Image(person.imageName)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 25)
//                .clipShape(Circle())
//
//
//            Text(((person.posts?[postNum].ttime!)!))
//                .font(.caption2)
//        }
//        .frame(width: gp.size.width/6)
//
//        VStack(alignment: .leading, spacing: 10) {
//            HStack {
//                Text(person.name)
//
//                Text("@  G:/" + (person.posts?[postNum].target)!)
//                    .font(.caption)
//            }
//            Text((person.posts?[postNum].description)!)
//
//            HStack {
//                LikedButton(isSet: liked)
//                Spacer()
//                Button(action: {
//
//                }, label: {
//                    Image(systemName: "plus.bubble")
//                        .foregroundColor(.black)
//                })
//                Spacer()
//                Image(systemName: "paperplane")
//                Spacer()
//                Image(systemName: "bookmark")
//                Spacer()
//            }
//            .padding(.trailing)
//
//        }
//        .frame(width: gp.size.width * 5/6 - 10)
//    }
//    .frame(width: gp.size.width, alignment: .center)
//}
