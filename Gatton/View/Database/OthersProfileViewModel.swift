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

class OtherProfileViewModel: ObservableObject {
    
    // MARK: - Public properties
    
    @Published var userInfo = UserModel(id: "", username: "", pic: "", bio: "", year : "", city: "", state: "", interests: "")
        
    //        = UserModel(id: "", username: "", pic: "", bio: "", year : 1, city: "", state: "", interests: "")
    @Published var modified = false
    
    //image picker for updating image
    @Published var picker = false
    @Published var img_Data = Data(count: 0)
    
    //loading view
    @Published var isLoading = false
    @Published var editing = false
    
        
    
    
    let ref = Firestore.firestore()

//
//    init() {
//        fetchUser(uid:uid) { (user) in
//            self.userInfo = user
//        }
//    }

    
}
