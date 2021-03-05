//
//  SettingsView.swift
//  Gatton
//
//  Created by Andrew Park on 2/16/21.
//

//CHECKED

import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct SettingsView: View {
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @StateObject var settingsData = SettingsViewModel()
    @Environment(\.presentationMode) var pres
    
    var body: some View {
        
        
        VStack{
            
            //BANNER
            HStack{
                Button(action: {
                    settingsData.editing.toggle()
                    pres.wrappedValue.dismiss()
                }, label: {
                    Text("Back")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                })
                Spacer()
                
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding()
            .padding(.top, edges!.top)
            .background(Color("bg"))
            .shadow(color: Color.white.opacity(0.06), radius: 5, x: 0, y: 5)

            
            //HSTACK PROFILE
            HStack {
                VStack {
                    //NAME
                    HStack(spacing: 15) {
                        Text(settingsData.userInfo.username)
                            .foregroundColor(.white)
                        
                        //edit button
                        Button(action: {settingsData.updateDetails(field: "Name")}) {
                            Image(systemName: "pencil.tip")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                    
                    //YEAR
                    HStack(spacing: 15) {
                        Text(String(settingsData.userInfo.year))
                            .foregroundColor(.white)
                        
                        //edit button
                        Button(action: {settingsData.updateYear(value: 2022)}) {
                            Image(systemName: "pencil.tip")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                        }
                    }
                    
                }
                
                //PROFILE PICTURE
                if settingsData.userInfo.pic != "" {
                    ZStack{
                        WebImage(url: URL(string: settingsData.userInfo.pic)!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 125, height: 125)
                            .clipShape(Circle())
                        
                        if settingsData.isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                        }
                    }
                    .padding(.top, 25)
                    .onTapGesture {
                        settingsData.picker.toggle()
                    }
                }
                
                VStack{
                    //CITY
                    HStack(spacing: 15) {
                        Text(settingsData.userInfo.city)
                            .foregroundColor(.white)
                        
                        //edit button
                        Button(action: {settingsData.updateDetails(field: "City")}) {
                            Image(systemName: "pencil.tip")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                        }
                    }
                    
                    //STATE
                    HStack(spacing: 15) {
                        Text(settingsData.userInfo.state)
                            .foregroundColor(.white)
                        
                        //edit button
                        Button(action: {settingsData.updateDetails(field: "State")}) {
                            Image(systemName: "pencil.tip")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                        }
                    }
                    
                }
                
            }
            
            VStack {
                //BIO
                HStack(spacing: 15) {
                    Text(settingsData.userInfo.bio)
                        .foregroundColor(.white)
                    
                    //edit button
                    Button(action: {settingsData.updateDetails(field: "Bio")}) {
                        Image(systemName: "pencil.tip")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                    }
                }
                
                //INTERESTS
                HStack(spacing: 15) {
                    Text(settingsData.userInfo.interests)
                        .foregroundColor(.white)
                    
                    //edit button
                    Button(action: {settingsData.updateDetails(field: "Interests")}) {
                        Image(systemName: "pencil.tip")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                    }
                }
                
            }
            
            
            //LOGOUT BUTTON
            Button(action: settingsData.logOut) {
                Text("LOGOUT")
                    .foregroundColor(.red)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 100)
            }
            .padding()
            .padding(.top, 10)
            
            Spacer()
            
        }
        .navigationBarHidden(true)
        .ignoresSafeArea().edgesIgnoringSafeArea(.top)
        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
        .sheet(isPresented: $settingsData.picker, content: {
            ImagePicker(picker: $settingsData.picker, img_Data: $settingsData.img_data)
        })
        .onChange(of: settingsData.img_data) { newData in
            //whenever image is selected update image in firebase
            settingsData.updateImage()
        }
        
        
        
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
