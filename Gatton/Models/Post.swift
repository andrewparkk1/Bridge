//
//  PostModel.swift
//  Gatton
//
//  Created by Andrew Park on 1/14/21.
//
import Firebase
import SwiftUI
import Foundation
import FirebaseFirestore
import FirebaseCore
//import FirebaseFirestoreSwift

enum target: String, CaseIterable {
    case general = "general", professors = "professors", classes = "classes", research = "research", qanda = "qanda", colleges = "colleges"
    func getTarget() -> String {
        return self.rawValue
    }
}


struct Post: Identifiable { //Codable
//    @DocumentID
    var id: String?
//    @ServerTimestamp Timestamp?
    var time: String
    var title: String
    var ttime: String?
    var userId: Person.ID?
    var description: String
    var target: String
    
    
//    let dateFormatter = DateFormatter()
//     dateFormatter.dateFormat = /////"HH:mm"
//     let newDateString = dateFormatter.string(from: /////yourDate)
    
//    init (_ description: String, _ time: Timestamp) {
//        self.description = description
//        self.time = time
//    }
    
    
    // create ability to upload photos
//    init (description: String, time: Timestamp) {
//        self.description = description
//        self.time = time
//        self.pic = pic
//    }
//
    
}




