//
//  UserModel.swift
//  Gatton
//
//  Created by Andrew Park on 2/16/21.
//

//CHECKED

import SwiftUI

struct UserModel: Identifiable {
    var id: String

    var username: String
    var pic: String
    var bio: String
    
    var year: Int
    var city: String
    var state: String
    var interests: String
    
}
