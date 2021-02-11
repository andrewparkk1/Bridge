//
//  Profile.swift
//  Gatton
//
//  Created by Andrew Park on 1/10/21.
//

import Foundation
import SwiftUI

enum Interests: String, CaseIterable {
    case Art, Music, Gaming, Reading, Business, Finance, Football, Baseball, Hockey, Equestrian, Basketball, Soccer, Lacrosse
}

enum SchoolInterests: String, CaseIterable {
    case CS, Math, Chemistry, Biology, Physics, Astronomy, Economy, Engineering
}


struct Person: Identifiable {
    let id = UUID()
    var name: String
    var imageName: String
    var year: Int
    var description: String
    var interests: [Interests]?
    var schoolInterest: [String]?
    var city: String
    var state: String
    var posts: [Post]?
    
}




//    init(name: String, imageName: String, year: Int, description: String, city: String, state: String, posts: [Post]?) {
//        self.name = name
//        self.imageName = imageName
//        self.year = year
//        self.description = description
//        self.city = city
//        self.state = state
//        self.posts = posts
//    }

    
//    func addPost(description, time) {
//        var new = Post.init(description: "asdf", time: Timestamp)
//
//    }
    
var personTestData = [
    Person(name: "Andrew Park", imageName: "andrew", year: 2022, description: "funny", city: "Crestwood", state: "KY", posts: AndrewsPostTestData),
    Person(name: "casey", imageName: "casey", year: 2022, description: "hard working", city: "Crestwood", state: "KY", posts: CaseysPostTestData),
    Person(name: "david", imageName: "david", year: 2021, description: "funnny", city: "la", state: "cali", posts: DavidsPostTestData),
    Person(name: "joji", imageName: "joji", year: 1909, description: "artistic", city: "nyc", state: "new york", posts: JojisPostTestData),
    Person(name: "don", imageName: "don", year: 2021, description: "cool kid", city: "buckner", state: "ky", posts: DonsPostTestData)
]

//@Published var people: [Person] = ModelData.createPersons()
//
//static func createPersons() -> [Person] {
//    return [
//    (Person(name: "casey", imageName: "casey", year: 2022, description: "hard working", interests: "videography", city: "Crestwood", state: "KY", id: 1000)),
//    (Person(name: "david", imageName: "david", year: 2025, description: "funnny", interests: "vlog", city: "la", state: "cali", id: 1001)),
//    (Person(name: "joji", imageName: "joji", year: 1909, description: "artistic", interests: "music", city: "nyc", state: "new york", id: 1002))
//    ]
//}
