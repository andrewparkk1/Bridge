//
//  NewPostModel.swift
//  Gatton
//
//  Created by Andrew Park on 2/17/21.
//

//CHECKED

import SwiftUI
import Firebase

class NewPostModel: ObservableObject {
    @Published var postTxt = ""
    @Published var postTxtHead = ""
    @Published var postTxtTarget = "General"
    
    //image picker
    @Published var picker = false
    @Published var img_Data = Data(count: 0)
   
    @Published var isPosting = false
//    let uid = Auth.auth().currentUser!.uid
    @Published var uid = Auth.auth().currentUser!.uid
    
    
    func post(updateId: String, present: Binding<PresentationMode>){
        //posting data
        isPosting = true
        
        if updateId != ""{
            //updating data
            ref.collection("Posts").document(updateId).updateData([
                "header": postTxtHead,
                "target": postTxtTarget,
                "title": postTxt
            ]) { err in
                self.isPosting = false
                if err != nil{return}
                
                present.wrappedValue.dismiss()
            }
            return
        }
        
        if img_Data.count == 0 {
            ref.collection("Posts").document().setData([
                "header" : self.postTxtHead,
                "title" : self.postTxt,
                "target" : self.postTxtTarget,
                "url": "",
                "ref": ref.collection("Users").document(self.uid),
                "time": Date()
            ]) { err in
                if err != nil{
                    self.isPosting = false
                    return
                }
                
                self.isPosting = false
                //clsoing view when successfully posted
                present.wrappedValue.dismiss()
            }
        }
        else {
            UploadImage(imageData: img_Data, path: "post_Pics") { url in
                ref.collection("Posts").document().setData([
                    "header" : self.postTxtHead,
                    "target" : self.postTxtTarget,
                    "title" : self.postTxt,
                    "url": url,
                    "ref": ref.collection("Users").document(self.uid),
                    "time": Date()
                    
                ]) { err in
                    if err != nil{
                        self.isPosting = false
                        return
                    }
                    
                    self.isPosting = false
                    //clsoing view when successfully posted
                    present.wrappedValue.dismiss()
                }
            }
        }
    }
    
    
    func postAnonymous(updateId: String, present: Binding<PresentationMode>){
        //posting data
        isPosting = true
        
        if updateId != ""{
            //updating data
            ref.collection("Posts").document(updateId).updateData([
                "header": postTxtHead,
                "target": postTxtTarget,
                "title": postTxt
            ]) { err in
                self.isPosting = false
                if err != nil{return}
                
                present.wrappedValue.dismiss()
            }
            return
        }
        
        if img_Data.count == 0 {
            ref.collection("Posts").document().setData([
                "header" : self.postTxtHead,
                "title" : self.postTxt,
                "target" : self.postTxtTarget,
                "url": "",
                "ref": ref.collection("Users").document("Anonymous"),
                "time": Date()
            ]) { err in
                if err != nil{
                    self.isPosting = false
                    return
                }
                
                self.isPosting = false
                //clsoing view when successfully posted
                present.wrappedValue.dismiss()
            }
        }
        else {
            UploadImage(imageData: img_Data, path: "post_Pics") { url in
                ref.collection("Posts").document().setData([
                    "header" : self.postTxtHead,
                    "target" : self.postTxtTarget,
                    "title" : self.postTxt,
                    "url": url,
                    "ref": ref.collection("Users").document("Anonymous"),
                    "time": Date()
                    
                ]) { err in
                    if err != nil{
                        self.isPosting = false
                        return
                    }
                    
                    self.isPosting = false
                    //clsoing view when successfully posted
                    present.wrappedValue.dismiss()
                }
            }
        }
    }
}
