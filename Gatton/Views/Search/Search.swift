//
//  Search.swift
//  Gatton
//
//  Created by Andrew Park on 1/12/21.
//

import SwiftUI

struct Search: View {
    @EnvironmentObject var modelData: ModelData
    
    private let rows = Array(repeating: GridItem(.flexible(), spacing: 0), count: 6)
    
    
    var body: some View {
        //ScrollView {
        GeometryReader { gp in
            NavigationView {
                LazyHGrid(rows: rows) {
                    
                    //                ForEach(sortprof) { post in
                    //                    PostView(person: person, postNum: 0)
                    //                    Divider()
                    //                }
                    
                    NavigationLink(destination: commetnts()) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.red)
                                .frame(width: gp.size.width, height: gp.size.height / 6 + 15)
                            
                            Text("prof")
                        }
                    }
                    
                    
                    NavigationLink(destination: commetnts()) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.blue)
                                .frame(width: gp.size.width, height: gp.size.height / 6)
                            Text("classes")
                        }
                    }
                    
                    NavigationLink(destination: commetnts()) {                        ZStack {
                        Rectangle()
                            .foregroundColor(.green)
                            .frame(width: gp.size.width, height: gp.size.height / 6)
                        Text("research")
                    }
                    }
                    
                    NavigationLink(destination: commetnts()) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.yellow)
                                .frame(width: gp.size.width, height: gp.size.height / 6)
                            Text("q and a")
                        }
                    }
                    
                    NavigationLink(destination: commetnts()) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.purple)
                                .frame(width: gp.size.width, height: gp.size.height / 6)
                            Text("colleges")
                        }
                    }
                    
                    NavigationLink(destination: commetnts()) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.gray)
                                .frame(width: gp.size.width, height: gp.size.height / 6)
                            Text("connect")
                        }
                    }
                }
                .foregroundColor(.black)
            }
            .navigationBarHidden(true)
            
            
        }
        
    }
}



struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}
