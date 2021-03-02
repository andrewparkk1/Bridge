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
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @Environment(\.presentationMode) private var presentationMode
    @State var presentActionSheet = false
    @StateObject var viewModel = ProfileViewModel()
    
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
            VStack {
                HStack{
                    cancelButton
                    Spacer()
                    Text("Settings")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    Spacer(minLength: 0)
                    saveButton
                    
                }
                .padding()
                .padding(.top, edges!.top)
                .background(Color("bg"))
                .shadow(color: Color.white.opacity(0.06), radius: 5, x: 0, y: 5)
                                        
                if viewModel.userInfo.pic != "" {
                    
                    ZStack {
                        
                        if viewModel.isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                        }
                        
                        if viewModel.img_Data.count == 0 {
                            WebImage(url: URL(string: viewModel.userInfo.pic)!)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 125, height: 125)
                                .clipShape(Circle())
                        }
                        else {
                            Image(uiImage: UIImage(data: viewModel.img_Data)!)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 115, height: 115)
                                .clipShape(Circle())
                        }
                    }
                    .padding(.top)
                    .onTapGesture(perform: {
                        viewModel.picker.toggle()
                    })
                }
                
                Form {
                    Section(header: Text("Name")) { // (3)
                        TextField("Name", text: $viewModel.userInfo.username)
                    }
                    Section(header: Text("Year")) { // (3)
                        TextField("Year", value: $viewModel.userInfo.year, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                    }
                    Section(header: Text("Bio")) { // (3)
                        TextField("Bio", text: $viewModel.userInfo.bio) // (4)
                    }
                    Section(header: Text("City")) { // (3)
                        TextField("City", text: $viewModel.userInfo.city) // (4)
                    }
                    Section(header: Text("State")) { // (3)
                        TextField("State", text: $viewModel.userInfo.state) // (4)
                    }
                    Section(header: Text("Interests")) { // (3)
                        TextField("Name", text: $viewModel.userInfo.interests) // (4)
                    }
                    Section {
                        Button("Delete Account") { self.presentActionSheet.toggle() }
                            .foregroundColor(.red)
                    }
                }
                Spacer()
                
            }
            .background(Color("bg")).edgesIgnoringSafeArea(.all)
            .navigationBarTitle(Text("Settings"))
            .navigationBarHidden(true)
            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $viewModel.picker, content: {
            ImagePicker(picker: $viewModel.picker, img_Data: $viewModel.img_Data)
        })
        
        //        .onChange(of: viewModel.img_Data) { newData in
        //            viewModel.updateImage()
        //        }
        .actionSheet(isPresented: $presentActionSheet) {
            ActionSheet(title: Text("Are you sure?"),
                        buttons: [
                            .destructive(Text("Delete User"),
                                         action: { self.handleDeleteTapped() }),
                            .cancel()
                        ])
        }
        .background(Color("bg")).edgesIgnoringSafeArea(.all)
        
        
        
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
