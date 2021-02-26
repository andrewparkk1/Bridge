//
//  PostModel.swift
//  Gatton
//
//  Created by Andrew Park on 2/16/21.
//

//CHECKED


import SwiftUI

enum target: String, CaseIterable {
    case general = "General", professors = "Professors", classes = "Classes", research = "Research", qanda = "QandA", colleges = "Colleges"
    func getTarget() -> String {
        return self.rawValue
    }
}

struct PostModel: Identifiable {
    var id: String
    var header: String
    var target: String
    var title: String
    var pic: String
    var time: Date
    var user: UserModel

    
}
