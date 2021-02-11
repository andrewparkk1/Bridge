//
//  LikedButton.swift
//  Gatton
//
//  Created by Andrew Park on 1/12/21.
//

import SwiftUI

struct LikedButton: View {
    @State var isSet: Bool

    var body: some View {
        Button(action: {
            isSet.toggle()
        }) {
            Image(systemName: isSet ? "heart.fill" : "heart")
                .foregroundColor(isSet ? Color.red : Color.black)
        }
    }
}

struct LikedButton_Previews: PreviewProvider {
    static var previews: some View {
        LikedButton(isSet: false)
    }
}
