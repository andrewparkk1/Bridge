////
////  ProfileSummary.swift
////  Gatton
////
////  Created by Andrew Park on 2/11/21.
////
//
//import SwiftUI
//
//struct ProfileHost: View {
//    @Environment(\.editMode) var editMode
//    @EnvironmentObject var modelData: ModelData
//    @State private var draftProfile = personTestData[0]
//
//    var body: some View {
//        VStack() {
//            HStack {
//                if editMode?.wrappedValue == .active {
//                    Button("Cancel") {
//                        draftProfile = modelData.people[0]
//                        editMode?.animation().wrappedValue = .inactive
//                    }
//                }
//                Spacer()
//                EditButton()
//                    .padding(.horizontal)
//            }
//
//            if editMode?.wrappedValue == .inactive {
//                ProfileSummary(person: modelData.people[0])
//            } else {
//                ProfileEdit(person: $draftProfile)
//                    .onAppear {
//                        draftProfile = modelData.people[0]
//                    }
//                    .onDisappear {
//                        modelData.people[0] = draftProfile
//                    }
//            }
//            Spacer()
//        }
//        .padding()
//
//    }
//}
//
//struct ProfileSummary_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileHost()
//            .environmentObject(ModelData())
//    }
//}
