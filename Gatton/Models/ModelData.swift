//
//  PersonModel.swift
//  Gatton
//
//  Created by Andrew Park on 1/13/21.
//

import Foundation
import Firebase
import FirebaseCore
import FirebaseAnalytics
import FirebaseFirestore

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
    
    
}
