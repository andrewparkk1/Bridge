//
//  PostView.swift
//  Gatton
//
//  Created by Andrew Park on 2/16/21.
//

import SwiftUI

struct PostView: View {
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    var body: some View {
        VStack{
            
            HStack{
                Text("Posts")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                Spacer(minLength: 0)
                
                Button(action: {}, label: {
                    Image(systemName: "square.and.pencil")
                        .font(.title)
                        .foregroundColor(.white)
                })
                
                
            }
            .padding()
            .padding(.top, edges!.top)
            //top shadow effect
            .background(Color("bg"))
            .shadow(color: Color.white.opacity(0.06), radius: 5, x: 0, y: 5)
            
            Spacer(minLength: 0)
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
