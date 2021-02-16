//
//  GattonApp.swift
//  Gatton
//
//  Created by Andrew Park on 1/10/21.
//

import Foundation
import SwiftUI
import Firebase
//import FirebaseFirestore
//import FirebaseCore
//import FirebaseFirestoreSwift
//import FirebaseAuth

@main
struct GattonApp: App {
    @UIApplicationDelegateAdaptor(Appdelegate.self) var delegate
    
//    @LazyInjected var authenticationService: AuthenticationService
    
//    init() {
//      FirebaseApp.configure()
//      //authenticationService.signIn()
//    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL(perform: { url in
                    Auth.auth().canHandle(url)
                })
        }
    }
}

class Appdelegate : NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
    }
    

}



//    let authUI = FUIAuth.defaultAuthUI()
//    authUI.delegate = self
//    let providers: [FUIAuthProvider] = [
//      FUIEmailAuth()
//    ]
//    self.authUI.providers = providers
