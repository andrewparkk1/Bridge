//
//  PersonModel.swift
//  Gatton
//
//  Created by Andrew Park on 1/13/21.
//

import Foundation
import Firebase
//import FirebaseCore
//import FirebaseAnalytics
//import FirebaseFirestore

class ModelData: ObservableObject {
    //    @Published var people = [Person]()
    //    @Published var posts = [Post]()
    //    @Published var research = [Research]()
    //
    //    private var db = Firestore.firestore()
    //    private var listenerRegistration: ListenerRegistration
    
    @Published var people = personTestData
    @Published var research = researchTestData
    @Published var classprofessors = classProfessorsTestData
    @Published var posts = postsTestData
}

var personTestData = [
    Person(name: "Andrew Park", imageName: "andrew", year: 2022, description: "funny", city: "Crestwood", state: "KY", posts: postsTestData),
    Person(name: "casey", imageName: "casey", year: 2022, description: "hard working", city: "Crestwood", state: "KY"),
    Person(name: "david", imageName: "david", year: 2021, description: "funnny", city: "la", state: "cali"),
    Person(name: "joji", imageName: "joji", year: 1909, description: "artistic", city: "nyc", state: "new york"),
    Person(name: "don", imageName: "don", year: 2021, description: "cool kid", city: "buckner", state: "ky")
]

var postsTestData = [
    Post(time: "asdf", title: "researhc", ttime: "3 months", description: "hello", target: target.general.getTarget()),
    Post(time: "adsf", title: "researhc", ttime: "6 minutes", description: "i like my researchalsjdnfjlasndjfnajsdnfojnasjodfnjoansdjonfojandsofn", target: target.research.getTarget()),
    Post(time: "asdf", title: "researhc", ttime: "2 hours", description: "i post vlogs", target: target.general.getTarget()),
    Post(time: "adsf", title: "researhc",ttime: "3 min", description: "Im the og", target: target.general.getTarget()),
    Post(time: "adsf", title: "researhc",ttime: "just now", description: "i like professor xing", target: target.professors.getTarget()),
    Post(time: "adsf", title: "researhc",ttime: "2 min", description: "why is cheryl so mean?", target: target.qanda.getTarget())
]

