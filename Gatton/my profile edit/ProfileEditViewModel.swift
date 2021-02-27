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

class ProfileEditViewModel: ObservableObject {
    
    // MARK: - Public properties
    
    @Published var user: UserModel = UserModel(id: "", username: "", pic: "", bio: "", year : 0, city: "", state: "", interests: "")
    @Published var modified = false
    
    //image picker for updating image
    @Published var picker = false
    @Published var img_data = Data(count: 0)
    
    //loading view
    @Published var isLoading = false
    @Published var editing = false
    
    let db = Firestore.firestore()
    let uid = Auth.auth().currentUser!.uid
    
    private var cancellables = Set<AnyCancellable>()

    init() {
        fetchUser(uid: uid) { (user) in
            self.user = user
        }
    }
    
    func handleDoneTapped() {
        self.update(user: self.user)
    }
    
    func update(user: UserModel) {
        self.updateUser(user)
    }

    private func updateUser(_ user: UserModel) {
        guard let userId = user.id else {return}

        do {
            try db.collection("Users").document(userId).setData(from: user)
        } catch {
            fatalError("Unable to update card: \(error.localizedDescription).")
        }
        
        //refreshing view
        fetchUser(uid: self.uid) { user in
            self.user = user
        }
        
      }
    
    func updateImage() {
        isLoading = true
        
        UploadImage(imageData: img_data, path: "profile_Photos") { (url) in
            self.db.collection("Users").document(self.uid).updateData([
                "imageurl": url,
            ]) { (err) in
                if err != nil{return}
                
                //updating view
                self.isLoading = false
                fetchUser(uid: self.uid) { (user) in
                    self.user = user
                }
            }
        }
    }
    

    
    //DELETE ACCOUNT
    func handleDeleteTapped() {
        self.removeUser()
    }
    
    private func removeUser() {
            // [START delete_document]
//        try! Auth.auth().signOut()
//        status = false
        db.collection("Users").document(user.id!).delete() { err in
                if let err = err {
                    print("Error removing document: \(err)")
                } else {
                    print("Document successfully removed!")
                }
            }
            // [END delete_document]
        }

    
}



