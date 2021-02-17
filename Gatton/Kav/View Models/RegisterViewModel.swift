//
//  RegisterViewModel.swift
//  Gatton
//
//  Created by Andrew Park on 2/16/21.
//

import Foundation
import SwiftUI
import Firebase

class RegisterViewModel: ObservableObject{
    @Published var name = ""
    @Published var bio = ""
    @Published var image_data = Data(count: 0)
    @Published var picker = false
    let ref = Firestore.firestore()
    
    //loading view
    @Published var isLoading = false
    @AppStorage("current_status") var status = false
    
    
    func register(){
        isLoading = true
        
        //setting user data to firestore
        let uid = Auth.auth().currentUser!.uid
        
        UploadImage(imageData: image_data, path: "profile_Photos") { (url) in
            self.ref.collection("Users").document(uid).setData([
                "uid": uid,
                "imageurl": url,
                "username": self.name,
                "bio": self.bio,
                "dateCreated": Date()
            ]) { (err) in
                
                if err != nil {
                    self.isLoading = false
                    return
                }
                self.isLoading = false
                //succes means settings status as true
                self.status = true
            }
            
        }
        
    }
}
