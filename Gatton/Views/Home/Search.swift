//
//  Search.swift
//  Gatton
//
//  Created by Andrew Park on 1/12/21.
//

import SwiftUI

struct Search: View {
    var body: some View {
        //ScrollView {
        VStack {
            ZStack {
                Rectangle()
                    .foregroundColor(.red)
                Text("prof")
            }
            
            ZStack {
                Rectangle()
                    .foregroundColor(.blue)
                Text("classes")
            }


            ZStack {
                Rectangle()
                    .foregroundColor(.green)
                Text("research")
            }

            ZStack {
                Rectangle()
                    .foregroundColor(.yellow)
                Text("q and a")
            }
            ZStack {
                Rectangle()
                    .foregroundColor(.purple)
                Text("colleges")
            }
            ZStack {
                Rectangle()
                    .foregroundColor(.gray)
                Text("connect")
            }
            
            
        //
            
        }
            
        
        
    }
}



struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}
