//
//  PostModel.swift
//  Gatton
//
//  Created by Andrew Park on 2/16/21.
//

import SwiftUI

struct PostModel: Identifiable {
    var id: String
    var title: String
    var pic: String
    var time: Date
    var user: UserModel

}
