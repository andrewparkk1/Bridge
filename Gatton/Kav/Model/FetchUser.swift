//
//  FetchUser.swift
//  Gatton
//
//  Created by Andrew Park on 2/16/21.
//

//CHECKED

import SwiftUI
import Firebase

let ref = Firestore.firestore()

func fetchUser(uid: String, completion: @escaping (UserModel) -> ()){
    ref.collection("Users").document(uid).getDocument { (doc, err) in
        guard let user = doc else{return}
        
        let username = user.data()?["username"] as! String
        let pic = user.data()?["imageurl"] as! String
        let bio = user.data()?["bio"] as! String
        let uid = user.documentID
        
        DispatchQueue.main.async {
            completion(UserModel(username: username, pic: pic, bio: bio, uid: uid))
        }

    }
}
