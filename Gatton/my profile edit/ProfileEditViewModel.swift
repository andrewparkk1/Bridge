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
    @Published var isLoading = false
    let db = Firestore.firestore()
    let uid = Auth.auth().currentUser!.uid
    
    private var cancellables = Set<AnyCancellable>()

    init() {
        fetchUser(uid: uid) { (user) in
            self.user = user
        }
    }
    
//    init(user: UserModel = UserModel(id: "", username: "", pic: "", bio: "", year : 0, city: "", state: "", interests: "")) {
//      self.user = user
//
//      self.$user
//        .dropFirst()
//        .sink { [weak self] book in
//          self?.modified = true
//        }
//        .store(in: &self.cancellables)
//    }
    
    
//    private func updateUser(_ user: UserModel) {
//        if let documentId = user.id {
//          do {
//            try db.collection("Users").document(documentId).setData(from: user)
//          }
//          catch {
//            print(error)
//          }
//        }
//      }
    
    private func updateUser(_ user: UserModel) {
        guard let userId = user.id else {return}

        do {
            try db.collection("Users").document(userId).setData(from: user)
        } catch {
            fatalError("Unable to update card: \(error.localizedDescription).")
        }
      }


    private func removeUser() {
            // [START delete_document]
        db.collection("Users").document(user.id!).delete() { err in
                if let err = err {
                    print("Error removing document: \(err)")
                } else {
                    print("Document successfully removed!")
                }
            }
            // [END delete_document]
        }
    
//    private func updateUserNow() {
//      if let _ = user.id {
//        self.updateUser(self.user)
//      }
//    }
    
    func update(user: UserModel) {
        self.updateUser(user)
    }
    
    func handleDoneTapped() {
        self.update(user: self.user)
    }
    
    func handleDeleteTapped() {
        self.removeUser()
    }
    
}



