//
//  Research.swift
//  Gatton
//
//  Created by Andrew Park on 1/10/21.
//

import Foundation
import SwiftUI


struct Research: Identifiable {
    var id = UUID()
    var name: String
    var reviews: [Post]?
    
}

let researchTestData = [
    Research(name: "Bob Dylan"),
    Research(name: "Moon Kim")
]
