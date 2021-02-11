//
//  GattonApp.swift
//  Gatton
//
//  Created by Andrew Park on 1/10/21.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseCore
import FirebaseFirestoreSwift
import FirebaseUI
import FirebaseAuth

@main
struct GattonApp: App {
    
//    @LazyInjected var authenticationService: AuthenticationService
    
    init() {
      FirebaseApp.configure()
      //authenticationService.signIn()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}



//    let authUI = FUIAuth.defaultAuthUI()
//    authUI.delegate = self
//    let providers: [FUIAuthProvider] = [
//      FUIEmailAuth()
//    ]
//    self.authUI.providers = providers
