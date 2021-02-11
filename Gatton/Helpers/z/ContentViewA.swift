//
//  ContentViewA.swift
//  Gatton
//
//  Created by Andrew Park on 2/1/21.
//

import SwiftUI

struct ContentViewA : View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello World")
                NavigationLink(destination: ContentViewB()) {
                    Text("Go To Next Step")
                }
            }
        }
    }
}



struct ContentViewB : View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello World B")
                
            }.navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct ContentViewC: View {
    var body: some View {
        NavigationView {
            Text("SwiftUI")
                .navigationBarTitle("Welcome")
                .navigationBarItems(trailing:
                                        Button("Help") {
                                            print("Help tapped!")
                                        }
                )
        }
    }
}

struct ContentViewD: View {
    var body: some View {
        NavigationView {
            Text("anonym")
                .navigationBarItems(leading:
                                        Button(action: {
                                            print("asdf")
                                        }, label: {
                                            Text("Cancel")
                                        })
                )
//                    .navigationBarItems(trailing:
//                                            Button(action: {
//                                                self.posted = true
//                                            }, label: {
//                                                Text("Post")
//                                            }))
            
        }
    }
}

//struct PinPad: View {
//    var body: some View {
//        HStack {
//            Spacer()
//            VStack {
//                MyGridView().border(Color.blue, width: 3)
//                HStack {
//                    Button(action: {}, label: { Text("Left Align") }).border(Color.red, width: 3)
//                    Spacer()
//                    Button(action: {}, label: { Text("Right Align") }).border(Color.red, width: 3)
//                }
//            }.border(Color.green, width: 3)
//            Spacer()
//        }
//    }
//}



struct ContentViewA_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewA()
    }
}
