//
//  PostViewModel.swift
//  Gatton
//
//  Created by Andrew Park on 2/16/21.
//

//CHECKED

import SwiftUI
import Firebase

class PostViewModel: ObservableObject {
    @Published var posts : [PostModel] = []
    @Published var noPosts = false
    @Published var newPost = false
    @Published var updateId = ""
    @Published var professors : [PostModel] = []
    @Published var classes : [PostModel] = []
    @Published var research : [PostModel] = []
    @Published var qanda : [PostModel] = []
    @Published var colleges : [PostModel] = []

    
    
    init() {
        getAllPosts()
    }
    
    func getAllPosts() {
        ref.collection("Posts").addSnapshotListener{ (snap, err) in
            guard let docs = snap else{
                self.noPosts = true
                return
            }
            
            if docs.documentChanges.isEmpty{
                self.noPosts = true
                return
            }
            
            docs.documentChanges.forEach { (doc) in
                //check if doc is added
                if doc.type == .added{
                    
                    //retrieving and appending
                    
                    let title = doc.document.data()["title"] as! String
                    let pic = doc.document.data()["url"] as! String
                    let userRef = doc.document.data()["ref"] as! DocumentReference
                    let time = doc.document.data()["time"] as! Timestamp
                    let target = doc.document.data()["target"] as! String
                    let header = doc.document.data()["header"] as! String
                    
                    //getting user data
                    fetchUser(uid: userRef.documentID) { user in
                        
                        self.posts.append(PostModel(id: doc.document.documentID, header: header, target: target, title: title, pic: pic, time: time.dateValue(), user: user))
                        //sorting all model while reading docs
                        self.posts.sort { (p1, p2) -> Bool in
                            return p1.time > p2.time
                        }
                        
                        
                        if target == "Professors" {
                            self.professors.append(PostModel(id: doc.document.documentID, header: header, target: target, title: title, pic: pic, time: time.dateValue(), user: user))
                            //sorting all model while reading docs
                            self.professors.sort { (p1, p2) -> Bool in
                                return p1.time > p2.time
                            }
                        }
                        
                        if target == "Classes" {
                            self.classes.append(PostModel(id: doc.document.documentID, header: header, target: target, title: title, pic: pic, time: time.dateValue(), user: user))
                            //sorting all model while reading docs
                            self.classes.sort { (p1, p2) -> Bool in
                                return p1.time > p2.time
                            }
                        }
                        if target == "Research" {
                            self.research.append(PostModel(id: doc.document.documentID, header: header, target: target, title: title, pic: pic, time: time.dateValue(), user: user))
                            //sorting all model while reading docs
                            self.research.sort { (p1, p2) -> Bool in
                                return p1.time > p2.time
                            }
                        }
                        if target == "QandA" {
                            self.qanda.append(PostModel(id: doc.document.documentID, header: header, target: target, title: title, pic: pic, time: time.dateValue(), user: user))
                            //sorting all model while reading docs
                            self.qanda.sort { (p1, p2) -> Bool in
                                return p1.time > p2.time
                            }
                        }
                        if target == "Colleges" {
                            self.colleges.append(PostModel(id: doc.document.documentID, header: header, target: target, title: title, pic: pic, time: time.dateValue(), user: user))
                            //sorting all model while reading docs
                            self.colleges.sort { (p1, p2) -> Bool in
                                return p1.time > p2.time
                            }
                        }  
                        
                    }
                }
                
                if doc.type == .removed {
                    let id = doc.document.documentID
                    
                    self.posts.removeAll { post -> Bool in
                        return post.id == id
                    }
                }
                
                if doc.type == .modified{
                    //firebase is firing modified when new doc is write
                    print("Updated")
                    //updating doc
                    let id = doc.document.documentID
                    let title = doc.document.data()["title"] as! String
                    let target = doc.document.data()["target"] as! String
                    let header = doc.document.data()["header"] as! String
                    
                    let index = self.posts.firstIndex { post -> Bool in
                        return post.id == id
                    } ?? -1
                    
                    //safe check
                    
                    if index != -1 {
                        self.posts[index].title = title
                        self.posts[index].target = target
                        self.posts[index].header = header
                        self.updateId = ""
                    }
                }
            }
        }
    }
    
    
    func deletePost(id: String) {
        ref.collection("Posts").document(id).delete { err in
            if err != nil {
                print(err!.localizedDescription)
                return
            }
        }
    }
    
    
    func editPost(id: String) {
        updateId = id
        newPost.toggle()
    }
    
}
