//
//  Database.swift
//  Gatton
//
//  Created by Andrew Park on 1/30/21.
//

import SwiftUI

struct Database: View {
    @EnvironmentObject var modelData: ModelData
    
    private var ttstudents: [Person] {
        modelData.people.filter { person in
            person.year == 2022
        }
    }
    private var tostudents: [Person] {
        modelData.people.filter { person in
            person.year == 2021
        }
    }
    private var alumni: [Person] {
        modelData.people.filter { person in
            person.year < 2021
        }
    }
    
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
                    ForEach(ttstudents) { person in
                        DatabaseUnit(person: person)
                    }
                }
        
                Divider().background(Color.gray).frame(height: 50)
                Divider().background(Color.gray).frame(height: 50)
        
        
                Section(header: Text("2021").font(.title).bold()) {
                    ForEach(tostudents) { person in
                        DatabaseUnit(person: person)
                    }
                }
        
                Divider().background(Color.gray).frame(height: 50)
                Divider().background(Color.gray).frame(height: 50)
        
                Section(header: Text("Alumni").font(.title).bold()) {
                    ForEach(alumni) { person in
                        DatabaseUnit(person: person)
                    }
                }
            }
        }

        
    }
}


struct Database_Previews: PreviewProvider {
    static var previews: some View {
        Database().environmentObject(ModelData())
    }
}
