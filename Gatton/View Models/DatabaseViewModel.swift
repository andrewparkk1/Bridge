//
//  DatabaseViewModel.swift
//  Gatton
//
//  Created by Andrew Park on 2/24/21.
//

import SwiftUI
import Firebase

class DatabaseViewModel: ObservableObject {
    @Published var users : [UserModel] = []
    @Published var user2022: [UserModel] = []
    @Published var user2021: [UserModel] = []
    @Published var alumni: [UserModel] = []
    @Published var noPeople = false

    
    
    init() {
        getAllPeople()
    }
    
    func getAllPeople() {
        ref.collection("Users").addSnapshotListener{ (snap, err) in
            guard let docs = snap else{
                self.noPeople = true
                return
            }
            
            if docs.documentChanges.isEmpty{
                self.noPeople = true
                return
            }
            
            docs.documentChanges.forEach { (doc) in
                //check if doc is added
                if doc.type == .added{
                    let data = doc.document.data()
                    let username = data["username"] as! String
                    let pic = data["imageurl"] as! String
                    let bio = data["bio"] as! String
                    
                    let year = data["year"] as! String
                    let city = data["city"] as! String
                    let state = data["state"] as! String
                    let interests = data["interests"] as! String
                    
                    self.users.append(UserModel(id: doc.document.documentID, username: username, pic: pic, bio: bio, year: year, city: city, state: state, interests: interests))
                    
                    if year == "2022" {
                        self.user2022.append(UserModel(id: doc.document.documentID, username: username, pic: pic, bio: bio, year: year, city: city, state: state, interests: interests))
                    }
                    
                    if year == "2021" {
                        self.user2021.append(UserModel(id: doc.document.documentID, username: username, pic: pic, bio: bio, year: year, city: city, state: state, interests: interests))
                    }
                    
                    if year < "2021" {
                        self.alumni.append(UserModel(id: doc.document.documentID, username: username, pic: pic, bio: bio, year: year, city: city, state: state, interests: interests))
                    }
                    
                    
                }
                
//                if doc.type == .removed {
//                    let id = doc.document.documentID
//
//                    self.posts.removeAll { post -> Bool in
//                        return post.id == id
//                    }
//                }
//
//                if doc.type == .modified{
//                    //firebase is firing modified when new doc is write
//                    print("Updated")
//                    //updating doc
//                    let id = doc.document.documentID
//                    let title = doc.document.data()["title"] as! String
//                    let target = doc.document.data()["target"] as! String
//                    let header = doc.document.data()["header"] as! String
//
//                    let index = self.posts.firstIndex { post -> Bool in
//                        return post.id == id
//                    } ?? -1
//
//                    //safe check
//
//                    if index != -1 {
//                        self.posts[index].title = title
//                        self.posts[index].target = target
//                        self.posts[index].header = header
//                        self.updateId = ""
//                    }
//
                
            }
        }
    }
    

    

}
