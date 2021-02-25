//
//  Database.swift
//  Gatton
//
//  Created by Andrew Park on 1/30/21.
//

import SwiftUI

struct Database: View {
    @StateObject var databaseData = DatabaseViewModel()

//    private var ttstudents: [UserModel] {
//        databaseData.users.filter { person in
//            person.year == 2022
//        }
//    }
//    private var tostudents: [UserModel] {
//        databaseData.users.filter { person in
//            person.year == 2021
//        }
//    }
//    private var alumni: [UserModel] {
//        databaseData.users.filter { person in
//            person.year < 2021
//        }
//    }
    
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 2)
    
    
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: columns,
                alignment: .center,
                spacing: 0,
                pinnedViews: [.sectionHeaders, .sectionFooters]
            ) {
                Section(header: Text("2022").font(.title).bold()) {
                    ForEach(databaseData.user2022) { person in
                        //Navigation link to specified person
                        DatabaseUnit(person: person)
                    }
                }
        
                Divider().background(Color.gray).frame(height: 50)
                Divider().background(Color.gray).frame(height: 50)
        
        
                Section(header: Text("2021").font(.title).bold()) {
                    ForEach(databaseData.user2021) { person in
                        DatabaseUnit(person: person)
                    }
                }
        
                Divider().background(Color.gray).frame(height: 50)
                Divider().background(Color.gray).frame(height: 50)
        
                Section(header: Text("Alumni").font(.title).bold()) {
                    ForEach(databaseData.alumni) { person in
                        DatabaseUnit(person: person)
                    }
                }
            }
        }

        
    }
}


