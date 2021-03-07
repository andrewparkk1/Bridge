//
//  Database.swift
//  Gatton
//
//  Created by Andrew Park on 1/30/21.
//

import SwiftUI

struct Database: View {
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    
    @StateObject var databaseData = DatabaseViewModel()
    
    
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 2)
    
    
    var body: some View {
        
        VStack {
            
            //BANNER
            HStack{
                Text("Database")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                Spacer(minLength: 0)
            }
            .padding()
            .padding(.top, edges!.top)
            .background(Color("bg"))
            .shadow(color: Color.white.opacity(0.06), radius: 5, x: 0, y: 5)
            
            
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
                            NavigationLink(destination: OthersProfileView(user: person)) {
                                DatabaseUnit(person: person)
                            }
                            .navigationBarHidden(true)
                            
                        }
                    }
                    
                    Divider().background(Color.gray).frame(height: 50)
                    Divider().background(Color.gray).frame(height: 50)
                    
                    
                    Section(header: Text("2021").font(.title).bold()) {
                        ForEach(databaseData.user2021) { person in
                            NavigationLink(destination: comments()) {
                                DatabaseUnit(person: person)
                            }
                            .navigationBarHidden(true)
                            
                        }
                    }
                    
                    Divider().background(Color.gray).frame(height: 50)
                    Divider().background(Color.gray).frame(height: 50)
                    
                    Section(header: Text("Alumni").font(.title).bold()) {
                        ForEach(databaseData.alumni) { person in
                            NavigationLink(destination: comments()) {
                                DatabaseUnit(person: person)
                            }
                            .navigationBarHidden(true)
                        }
                    }
                }
            }
        }
        
        
    }
}


