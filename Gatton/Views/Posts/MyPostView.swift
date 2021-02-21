//
//  Post.swift
//  Gatton
//
//  Created by Andrew Park on 1/11/21.
//

import SwiftUI

struct MyPostView: View {
    var person: Person
    var postNum: Int
    var liked = false
    
    private let columns: [GridItem] = [
        GridItem(alignment: .center),
        GridItem(alignment: .center),
        GridItem(alignment: .center)
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
            .padding(.horizontal)
            
            LazyHGrid(
                rows: columns,
                alignment: .center,
                spacing: 0
            ) {
                Section() {
                    HStack{
                        Text("by")
                        Text(person.name)
                        Text(" |")
                    }
                }
                
                Section() {
                    HStack{
                        Text(" ")
                        Text((person.posts?[postNum].ttime!)!)
                        Text(" |")
                    }
                }
                
                Section() {
                    HStack{
                        Text(" G:/")
                        Text((person.posts?[postNum].target)!)
                        Text(" ")
                    } 
                }
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
        }
    }
}

struct MyPost_Previews: PreviewProvider {
    static var previews: some View {
        MyPostView(person: personTestData[0], postNum: 1)
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
