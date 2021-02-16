//
//  LoginViewModel.swift
//  Gatton
//
//  Created by Andrew Park on 2/15/21.
//

import Foundation
import Firebase
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var code = ""
    @Published var number = ""
    
    //for errors
    @Published var errorMsg = ""
    @Published var error = false
    
    @Published var registerUser = false
    @AppStorage("current_status") var status = false
    
    func verifyUser() {
        
        //remove when testing in live
        Auth.auth().settings?.isAppVerificationDisabledForTesting = true
        
        let phoneNumber = "+" + code + number
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) {
            (ID, err) in
            
            if err != nil {
                self.errorMsg = err!.localizedDescription
                self.error.toggle()
                return
            }
            
            //if code sent successfully
            self.alertView { (Code) in
                let credential =
                    PhoneAuthProvider.provider().credential(withVerificationID: ID!, verificationCode: Code)
                Auth.auth().signIn(with: credential) { (res, err) in
                    if err != nil {
                        self.errorMsg = err!.localizedDescription
                        self.error.toggle()
                        return
                    }
                    self.checkUser()
                    
                }
                
                
            }
            
        }
    }
    
    
    func alertView(completion: @escaping (String) -> ()) {
        
        let alert = UIAlertController(title: "Verification", message: "Enter Code", preferredStyle: .alert)
        
        alert.addTextField { (txt) in
            txt.placeholder = "123456"
            
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive))
       
        alert.addAction(UIAlertAction(title: "Verify", style: .default, handler: { (_) in
            
            let code = alert.textFields![0].text ?? ""
            
            if code == "" {
                UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
                return
            }
            completion(code)
        }))
        
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)

        
    }
    
    func checkUser() {
        let ref = Firestore.firestore()
        let uid = Auth.auth().currentUser!.uid
        
        ref.collection("Users").whereField("uid", arrayContains: uid).getDocuments {
            (snap, err) in
            
            if err != nil{
                //no documnets
                //no user found
                self.registerUser.toggle()
                return
                 
            }
            if snap!.documents.isEmpty {
                self.registerUser.toggle()
                return
            }
            self.status = true
        }
    }
    
    
}
