//
//  Feed.swift
//  Gatton
//
//  Created by Andrew Park on 1/12/21.
//

import SwiftUI

struct Feed: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        ScrollView {
            ForEach(modelData.people) { person in
                PostView(person: person, postNum: 0)
                Divider()
            }
        }
    }
}

struct Feed_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        Feed().environmentObject(ModelData())
    }
}
