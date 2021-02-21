//
//  ContentView.swift
//  Gatton
//
//  Created by Andrew Park on 1/10/21.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("current_status") var status = false
    
    var body: some View {
        NavigationView {
            
            
            VStack {
                if status{Home()}
                else{Login()}
            }
                .preferredColorScheme(.dark)
                .navigationBarHidden(true)
            
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//sick animation
//NavigationView {
//    Button("Toggle Full Screen") {
//        self.fullScreen.toggle()
//    }
//    .navigationBarTitle("Full Screen")
//    .navigationBarHidden(fullScreen)
//}
//.statusBar(hidden: fullScreen)
