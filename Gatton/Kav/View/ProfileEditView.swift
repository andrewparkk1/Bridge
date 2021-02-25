////
////  ProfileEditView.swift
////  Gatton
////
////  Created by Andrew Park on 2/25/21.
////
//
//import SwiftUI
//
//struct ProfileEditView: View {
//    @Environment(\.presentationMode) private var presentationMode
//    @StateObject var viewModel = ProfileEditViewModel()
//
//    var body: some View {
//        NavigationView {
//          Form {
//            Section(header: Text("Name")) { // (3)
//              TextField("Name", text: $viewModel.book.title) // (4)
//              TextField("Number of pages", value: $viewModel.book.numberOfPages, formatter: NumberFormatter()) // (5)
//            }
//
//            Section(header: Text("Author")) { // (6)
//              TextField("Author", text: $viewModel.book.author) // (7)
//            }
//          }
//          .navigationBarTitle("New book", displayMode: .inline)
//          .navigationBarItems(
//            leading:
//              Button(action: { self.handleCancelTapped() }) {
//                Text("Cancel")
//              },
//            trailing:
//              Button(action: { self.handleDoneTapped() }) {
//                Text("Done")
//              }
//              .disabled(!viewModel.modified) // (8)
//            )
//        }
//      }
//
//      func handleCancelTapped() { // (9)
//        dismiss()
//      }
//
//      func handleDoneTapped() { // (10)
//        self.viewModel.handleDoneTapped()
//        dismiss()
//      }
//
//      func dismiss() { // (11)
//        self.presentationMode.wrappedValue.dismiss()
//      }
//    }
//
//struct ProfileEditView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileEditView()
//    }
//}
