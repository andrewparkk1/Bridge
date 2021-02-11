//
//  ContentView.swift
//  Gatton
//
//  Created by Andrew Park on 1/10/21.
//

import SwiftUI

struct ContentView: View {
    @State private var fullScreen = false
    
    var body: some View {
        NavigationView {
            Button("Toggle Full Screen") {
                self.fullScreen.toggle()
            }
            .navigationBarTitle("Full Screen")
            .navigationBarHidden(fullScreen)
        }
        .statusBar(hidden: fullScreen)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
