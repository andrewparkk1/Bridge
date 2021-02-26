//
//  ProfileEditViewModel.swift
//  Gatton
//
//  Created by Andrew Park on 2/25/21.
//

import SwiftUI
import Foundation
import Combine
import Firebase
import FirebaseFirestore

//class ProfileEditViewModel: ObservableObject {
//    @Published var user = UserModel(id: "", username: "", pic: "", bio: "", year : 0, city: "", state: "", interests: "")
//
//    @Published var modified = false
//    private var cancellables = Set<AnyCancellable>()
//
//    let ref = Firestore.firestore()
//    let uid = Auth.auth().currentUser!.uid
//
//    init() {
//        fetchUser(uid: uid) { (user) in
//            self.user = user
//        }
//    }
//
//
//}


class ProfileEditViewModel: ObservableObject {
    
    // MARK: - Public properties
    
    @Published var user: UserModel = UserModel(id: "", username: "", pic: "", bio: "", year : 0, city: "", state: "", interests: "")
    @Published var modified = false
    
    // MARK: - Internal properties
    
    private var cancellables = Set<AnyCancellable>()
    let db = Firestore.firestore()
    let uid = Auth.auth().currentUser!.uid
    
    init() {
        fetchUser(uid: uid) { (user) in
            self.user = user
        }
    }
    
    
    private func updateUser(user: UserModel) {
        let ref = db.collection("Users").document(user.id)
        ref.updateData([
            "username" : true
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
        // [END update_document]
    }
    
    private func removeUser(user: UserModel) {
            // [START delete_document]
        db.collection("Users").document(user.id).delete() { err in
                if let err = err {
                    print("Error removing document: \(err)")
                } else {
                    print("Document successfully removed!")
                }
            }
            // [END delete_document]
        }
    
    
    func handleDoneTapped() {
        self.updateUser(user: user)
    }
    
    func handleDeleteTapped() {
        self.removeUser(user: user)
    }
    
}



