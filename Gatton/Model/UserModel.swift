//
//  UserModel.swift
//  Gatton
//
//  Created by Andrew Park on 2/16/21.
//

//CHECKED

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct UserModel: Identifiable, Codable {
    @DocumentID var id: String?
    var username: String
    var pic: String
    var bio: String
    
    var year: String
    var city: String
    var state: String
    var interests: String

    enum CodingKeys: String, CodingKey {
        case id
        case username
        case pic
        case bio
        case year
        case city
        case state
        case interests
    }

    
}
