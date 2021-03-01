//
//  ProfileEditViewModel.swift
//  Gatton
//
//  Created by Andrew Park on 2/25/21.
//

//my draft

import SwiftUI
import Foundation
import Combine
import Firebase
import FirebaseFirestore

class ProfileViewModel: ObservableObject {
    
    // MARK: - Public properties
    
    @Published var userInfo = UserModel(id: "", username: "", pic: "", bio: "", year : 0, city: "", state: "", interests: "")
    @Published var modified = false
    
    //image picker for updating image
    @Published var picker = false
    @Published var img_Data = Data(count: 0)
    
    //loading view
    @Published var isLoading = false
    @Published var editing = false
    
    let ref = Firestore.firestore()
    let uid = Auth.auth().currentUser!.uid
    
    init() {
        fetchUser(uid:uid) { (user) in
            self.userInfo = user
        }
    }
    
    
    func handleDoneTapped() {
        self.updateUser(user: self.userInfo)
    }
    
    
    private func updateUser(user: UserModel) {
        guard let userId = user.id else {return}
        
        if img_Data.count == 0 {
            ref.collection("Users").document(userId).updateData([
                "username" : user.username,
                "bio" : user.bio,
                "city" : user.city,
                "state" : user.state,
                "interests" : user.interests,
                "year" : user.year
                
            ]) { err in
                if err != nil{
                    self.editing = false
                    return
                }
            }
        } else {
            UploadImage(imageData: img_Data, path: "profile_Photos") { url in
                self.ref.collection("Users").document(userId).updateData([
                    "username" : user.username,
                    "bio" : user.bio,
                    "city" : user.city,
                    "state" : user.state,
                    "interests" : user.interests,
                    "year" : user.year,
                    "pic": url
                    
                ]) { err in
                    if err != nil{
                        self.editing = false
                        return
                    }
                }
            }
        }
        
        fetchUser(uid: self.uid) { user in
            self.userInfo = user
        }
    }
    
    func updateImage() {
        isLoading = true
        UploadImage(imageData: img_Data, path: "profile_Photos") { (url) in
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
    
    
    
    
    
    
    
    
    
    
    
    
    
    //DELETE ACCOUNT
    func handleDeleteTapped() {
        self.removeUser()
    }
    
    func removeUser() {
        // [START delete_document]
        //        try! Auth.auth().signOut()
        //        status = false
        ref.collection("Users").document(userInfo.id!).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
        // [END delete_document]
    }
    
    
    
    
    
}
