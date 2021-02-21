//
//  UploadImage.swift
//  Gatton
//
//  Created by Andrew Park on 2/16/21.
//

//CHECKED

import SwiftUI
import Firebase

func UploadImage(imageData: Data, path: String, completion: @escaping (String) -> ()){
    let storage = Storage.storage().reference()
    let uid = Auth.auth().currentUser!.uid
    storage.child(path).child(uid).putData(imageData, metadata: nil) { (_, err) in
        if err != nil {
            completion("")
            return
        }
        
        //downlaoding url and sending back
        
        storage.child(path).child(uid).downloadURL { (url, err) in
            if err != nil {
                completion("")
                return
            }
            completion("\(url!)")
        }
    }
}
