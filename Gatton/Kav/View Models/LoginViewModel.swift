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
    
    //loading when searches for user...
    @Published var isLoading = false
    
    func verifyUser() {
        
        isLoading = true
        
        //remove when testing in live
        Auth.auth().settings?.isAppVerificationDisabledForTesting = true
        
        let phoneNumber = "+" + code + number
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) {
            (ID, err) in
            
            if err != nil {
                self.errorMsg = err!.localizedDescription
                self.error.toggle()
                self.isLoading = false
                return
            }
            
            //if code sent successfully
            alertView(msg: "Enter verification code") { Code in
                let credential =
                    PhoneAuthProvider.provider().credential(withVerificationID: ID!, verificationCode: Code)
                Auth.auth().signIn(with: credential) { (res, err) in
                    if err != nil {
                        self.errorMsg = err!.localizedDescription
                        self.error.toggle()
                        self.isLoading = false
                        return
                    }
                    self.checkUser()
                    
                }
            }
        }
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
                self.isLoading = false
                return
                
            }
            if snap!.documents.isEmpty {
                self.registerUser.toggle()
                self.isLoading = false
                return
            }
            self.status = true
        }
    }

}



