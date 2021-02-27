//
//  SettingsViewModel.swift
//  Gatton
//
//  Created by Andrew Park on 2/16/21.
//

//checked

import SwiftUI
import Firebase

class SettingsViewModel: ObservableObject {
    
    @Published var userInfo = UserModel(id: "", username: "", pic: "", bio: "", year : 0, city: "", state: "", interests: "")
    @AppStorage("current_status") var status = false
    
    //image picker for updating image
    @Published var picker = false
    @Published var img_data = Data(count: 0)
    
    //loading view
    @Published var isLoading = false
    @Published var editing = false

    
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

        alertView(msg: "Update \(field)") { txt in
            if txt != "" {
                if field == "Name" {
                    self.updateBio(id: "username", value: txt)
                }
                
                if field == "Bio" {
                    self.updateBio(id: "bio", value: txt)
                }
                
                if field == "City" {
                    self.updateBio(id: "city", value: txt)
                }
                
                if field == "State" {
                    self.updateBio(id: "state", value: txt)
                }
                
                if field == "Interests" {
                    self.updateBio(id: "interests", value: txt)
                }
                
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
    
    func updateYear(value: Int) {
        ref.collection("Users").document(uid).updateData([
            "year": value,
        ]) { err in
            if err != nil{return}
            
            //refreshing view
            fetchUser(uid: self.uid) { user in
                self.userInfo = user
            }
        }
    }
    
}


