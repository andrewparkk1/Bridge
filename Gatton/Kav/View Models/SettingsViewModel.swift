//
//  SettingsViewModel.swift
//  Gatton
//
//  Created by Andrew Park on 2/16/21.
//

import SwiftUI
import Firebase

class SettingsViewModel: ObservableObject {
    
    @Published var userInfo = UserModel(username: "", pic: "", bio: "", uid: "")
    @AppStorage("current_status") var status = false
    
    //image picker for updating image
    @Published var picker = false
    @Published var img_data = Data(count: 0)
    
    //loading view
    @Published var isLoading = false
    
    let ref = Firestore.firestore()
    let uid = Auth.auth().currentUser!.uid
    
    init() {
        fetchUser(uid: uid) { (user) in
            self.userInfo = user
        }
    }
    
    func logOut() {
        try! Auth.auth().signOut()
        status = false
    }
    
    
    func updateImage() {
        isLoading = true
        
        UploadImage(imageData: img_data, path: "profile_Photos") { (url) in
            self.ref.collection("Users").document(self.uid).updateData([
                "imageurl": url,
            ]) { (err) in
                if err != nil{return}
                
                //updating view
                self.isLoading = false
                fetchUser(uid: self.uid) { (user) in
                    self.userInfo = user
                }
            }
        }
    }
    
    func updateDetails(field: String) {
        alertView(msg: "Update  \(field)") { txt in
            if txt != "" {
                self.updateBio(id: field == "Name" ? "username" : "bio", value: txt)
            }
        }
    }
    
    func updateBio(id: String, value: String) {
        ref.collection("Users").document(uid).updateData([
            id: value,
        ]) { err in
            if err != nil{return}
            
            //refreshing view
            fetchUser(uid: self.uid) { user in
                self.userInfo = user
            }
        }
    }
    
    
}


