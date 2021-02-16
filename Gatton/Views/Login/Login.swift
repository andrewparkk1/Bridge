//
//  Login.swift
//  Gatton
//
//  Created by Andrew Park on 2/15/21.
//

import SwiftUI

struct Login: View {
    @StateObject var loginData = LoginViewModel()
    
    var body: some View {
        VStack {
            HStack{
                Text("login")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                Spacer(minLength: 0)
            }
            .padding()
            
            HStack(spacing: 15) {
                TextField("1", text: $loginData.code)
                    .padding()
                    .keyboardType(.numberPad)
                    .frame(width: 45)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(15)
                
                TextField("1234567890", text: $loginData.number)
                    .padding()
                    .keyboardType(.numberPad)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(15)
            }
            .padding()
            .padding(.top, 10)
            
            Button(action: loginData.verifyUser, label: {
                Text("Verify")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 100)
                    //.background(Color(UIColor(named: "blue")!))
                    .clipShape(Capsule())
                
            })
            .disabled(loginData.code == "" || loginData.number == "" ? true : false)
            .opacity(loginData.code == "" || loginData.number == "" ? 0.5 : 1)
            
            
            Spacer(minLength: 0)
        }
        .background(Color(UIColor(named: "green")!).ignoresSafeArea(.all, edges: .all))
        
        
        // displaying alert
        .alert(isPresented: $loginData.error, content: {
            Alert(title: Text("error"), message: Text(loginData.errorMsg), dismissButton: .destructive(Text("OK")))
        })
        .fullScreenCover(isPresented: $loginData.registerUser, content: {
            Register()
        })
        
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
