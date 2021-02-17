//
//  NewPost.swift
//  Gatton
//
//  Created by Andrew Park on 2/17/21.
//

import SwiftUI

struct NewPost: View {
    @StateObject var newPostData = NewPostModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct NewPost_Previews: PreviewProvider {
    static var previews: some View {
        NewPost()
    }
}
