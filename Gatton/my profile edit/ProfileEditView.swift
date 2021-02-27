//
//  ProfileEditView.swift
//  Gatton
//
//  Created by Andrew Park on 2/25/21.
//

//my draft


import SwiftUI
import Firebase
import SDWebImageSwiftUI


enum Action {
    case delete
    case done
    case cancel
}

struct ProfileEditView: View {
    @Environment(\.presentationMode) private var presentationMode
    @State var presentActionSheet = false
    @StateObject var viewModel = ProfileEditViewModel()

    var completionHandler: ((Result<Action, Error>) -> Void)?
    
    
    var cancelButton: some View {
        Button(action: { self.handleCancelTapped() }) {
            Text("Cancel")
        }
    }
    
    var saveButton: some View {
        Button(action: { self.handleDoneTapped() }) {
            Text("Done")
        }
        //.disabled(!viewModel.modified)
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Name")) { // (3)
                    TextField("Name", text: $viewModel.user.username) // (4)
                }
                Section(header: Text("Year")) { // (3)
                    TextField("Year", value: $viewModel.user.year, formatter: NumberFormatter())
                }
                Section(header: Text("Bio")) { // (3)
                    TextField("Bio", text: $viewModel.user.bio) // (4)
                }
                Section(header: Text("City")) { // (3)
                    TextField("City", text: $viewModel.user.city) // (4)
                }
                Section(header: Text("State")) { // (3)
                    TextField("State", text: $viewModel.user.state) // (4)
                }
                Section(header: Text("Interests")) { // (3)
                    TextField("Name", text: $viewModel.user.interests) // (4)
                }
                Section(header: Text("Profile Picture")) {
                    if viewModel.user.pic != "" {
                        ZStack{
                            WebImage(url: URL(string: viewModel.user.pic)!)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 125, height: 125)
                                .clipShape(Circle())
                            
                            if viewModel.isLoading {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                            }
                        }
                        .padding(.top, 25)
                        .onTapGesture {
                            viewModel.picker.toggle()
                        }
                    }
                }
                
                Section {
                    Button("Delete Account") { self.presentActionSheet.toggle() }
                        .foregroundColor(.red)
                }
                
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(
                leading: cancelButton,
                trailing: saveButton
            )
            .actionSheet(isPresented: $presentActionSheet) {
                ActionSheet(title: Text("Are you sure?"),
                            buttons: [
                                .destructive(Text("Delete User"),
                                             action: { self.handleDeleteTapped() }),
                                .cancel()
                            ])
            }
        }
    }
    
    func handleCancelTapped() {
        self.dismiss()
    }
    
    func handleDoneTapped() {
        self.viewModel.handleDoneTapped()
        self.dismiss()
    }
    
    func handleDeleteTapped() {
        viewModel.handleDeleteTapped()
        self.dismiss()
        self.completionHandler?(.success(.delete))
    }
    
    func dismiss() {
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct ProfileEditView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditView()
    }
}
