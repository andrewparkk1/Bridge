//
//  commetnts.swift
//  Gatton
//
//  Created by Andrew Park on 1/13/21.
//

import SwiftUI
/*
import SwiftUI

struct commetnts: View {
    //@State var top = 1
    @State var selected = 0
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.red
    }

    var body: some View {
        TabView(selection: $selected) {
            Search().tabItem({
                Text("Search")
            }).tag(0)
            
            Feed().tabItem({
                Text("Feed")
            }).tag(1)
            
        }
        .accentColor(Color.red)
    }
        
        /*
         HStack {
         
         Button(action: {
         self.top = 0
         
         }, label: {
         Text("Search")
         .foregroundColor(self.top == 0 ? .gray : Color.gray.opacity(0.45))
         .fontWeight(self.top == 0 ? .bold : .none)
         .padding(.top, 2.5)
         .padding(.trailing, 5)
         })
         
         Text("|").foregroundColor(.gray).opacity(0.45)
         
         
         Button(action: {
         self.top = 1
         }, label: {
         Text("Feed")
         .foregroundColor(self.top == 1 ? .gray : Color.gray.opacity(0.45))
         .fontWeight(self.top == 1 ? .bold : .none)
         .padding(.top, 2.5)
         .padding(.leading, 5)
         
         })
         }
         */
    
}


struct commetnts_Previews: PreviewProvider {
    static var previews: some View {
        commetnts()
        
        
    }
}
*/


struct commetnts: View {
    @State private var myArray: [String] = ["One", "Two", "Three"]
    var body: some View {
        NavigationView {
            VStack {
                Button("Insert item") {
                    myArray.append("Other")
                }
                List {
                    ForEach(myArray, id: \.self) { item in
                        Text(item)
                    }
                    .onDelete { indexSet in
                        myArray.remove(atOffsets: indexSet)
                    }
                }
            }
            .navigationBarTitle("Navigation")
            .navigationBarItems(trailing: EditButton())
        }
    }
}

struct commetnts_Previews: PreviewProvider {
    static var previews: some View {
        commetnts()
    }
}

struct text: View {
    @State var output: String = ""
    @State var input: String = ""
    @State var typing = false
    var body: some View {
        VStack {
            if !typing {
                if !output.isEmpty {
                    Text("You typed: \(output)")
                }
            } else if !input.isEmpty {
                Text("You are typing: \(input)")
            }
            TextField("", text: $input, onEditingChanged: {
                self.typing = $0
            }, onCommit: {
                self.output = self.input
            })
            .background(Color.green.opacity(0.2))
        }
    }
}

struct text_previews: PreviewProvider {
    static var previews: some View {
        text()
    }
}


