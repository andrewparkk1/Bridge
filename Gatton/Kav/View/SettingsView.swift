//
//  SettingsView.swift
//  Gatton
//
//  Created by Andrew Park on 2/16/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct SettingsView: View {
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @StateObject var settingsData = SettingsViewModel()
    var body: some View {
        VStack{
            
            HStack{
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                Spacer(minLength: 0)
            }
            .padding()
            .padding(.top, edges!.top)
            .background(Color("bg"))
            .shadow(color: Color.white.opacity(0.06), radius: 5, x: 0, y: 5)
            
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
            
            HStack(spacing: 15) {
                Text(settingsData.userInfo.username)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                //edit button
                Button(action: {settingsData.updateDetails(field: "Name")}) {
                    Image(systemName: "pencil.circle.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                }
            }
            .padding()
            
            HStack(spacing: 15) {
                Text(settingsData.userInfo.bio)
                    .foregroundColor(.white)
                
                //edit button
                Button(action: {settingsData.updateDetails(field: "Bio")}) {
                    Image(systemName: "pencil.circle.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                }
            }
            
            //logout button
            Button(action: settingsData.logOut) {
                Text("Logout")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 100)
                    .background(Color(.blue))
                    .clipShape(Circle())
            }
            .padding()
            .padding(.top, 10)
            
            Spacer(minLength: 0)
            
        }
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
