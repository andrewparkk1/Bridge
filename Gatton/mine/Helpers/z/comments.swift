//
//  comments.swift
//  Gatton
//
//  Created by Andrew Park on 1/18/21.
//

import Foundation
import SwiftUI

//import UIKit
//import Firebase
//
//@UIApplicationMain
//class AppDelegate: UIResponder, UIApplicationDelegate {
//
//  var window: UIWindow?
//
//  func application(_ application: UIApplication,
//    didFinishLaunchingWithOptions launchOptions:
//      [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
//    FirebaseApp.configure()
//    return true
//  }
//}



// PINNED VIEWS ON SCROLLING LIST
//ScrollView {
//    LazyVGrid(
//        columns: columns,
//        alignment: .center,
//        spacing: 0,
//        pinnedViews: [.sectionHeaders, .sectionFooters]
//    ) {
//        Section(header: Text("2022").font(.title).bold()) {
//            ForEach(ttstudents) { person in
//                DatabaseUnit(person: person)
//            }
//        }
//
//        Divider().background(Color.gray).frame(height: 50)
//        Divider().background(Color.gray).frame(height: 50)
//
//
//        Section(header: Text("2021").font(.title).bold()) {
//            ForEach(tostudents) { person in
//                DatabaseUnit(person: person)
//            }
//        }
//
//        Divider().background(Color.gray).frame(height: 50)
//        Divider().background(Color.gray).frame(height: 50)
//
//        Section(header: Text("Alumni").font(.title).bold()) {
//            ForEach(alumni) { person in
//                DatabaseUnit(person: person)
//            }
//        }
//    }
//}

struct comments: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Tab 1")
                .onTapGesture {
                    self.selectedTab = 1
                }
                .tabItem {
                    Image(systemName: "star")
                    Text("One")
                }
                .tag(0)
            
            Text("Tab 2")
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Two")
                }
                .tag(1)
        }
    }
    
}

struct commentpreview: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!").padding(EdgeInsets())
    }
}


