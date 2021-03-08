//
//  NewPost.swift
//  Gatton
//
//  Created by Andrew Park on 2/17/21.
//

//CHECKED

import SwiftUI

struct NewPostTab: View {
    @StateObject var newPostData = NewPostModel()
    @Environment(\.presentationMode) var present
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var updateId: String
    @Binding var selectedTab: String
    @State var name: String = "Me"
    
    
    var body: some View {
        VStack(spacing: 15){
            HStack {
                Button(action: {
                    self.updateId = ""
                    selectedTab = "house.fill"
                    present.wrappedValue.dismiss()
                }, label: {
                    Text("Cancel")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                })
                
                Spacer(minLength: 0)
                
                Button(action: {
                    if self.name == "Anonymous" {
                        self.name = "Me"
                    } else {
                        self.name = "Anonymous"
                    }
                }, label: {
                    Text(self.name)
                })
                
                Spacer(minLength: 0)

                
                if updateId == ""{
                    //only for new posts
                    Button(action: {newPostData.picker.toggle()}, label: {
                        Image(systemName: "photo.fill")
                            .font(.title)
                            .foregroundColor(.white)
                    })
                }
                
                Button(action: {
                    if self.name == "Me" {
                        newPostData.post(updateId: updateId, present: present)
                    } else {
                        newPostData.postAnonymous(updateId: updateId, present: present)
                    }
                    self.updateId = ""
                    selectedTab = "house.fill"
                    present.wrappedValue.dismiss()
                }, label: {
                    Text("Post")
                        .fontWeight(.bold)
                        .foregroundColor(colorScheme == .light ? .white : .black)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 25)
                        .background(Color(.green))
                        .clipShape(Capsule())
                })
                .disabled(newPostData.postTxt == "" ? true: false)
                .opacity(newPostData.postTxt == "" ? 0.5: 1)
                .disabled(newPostData.postTxtHead == "" ? true: false)
                .opacity(newPostData.postTxtHead == "" ? 0.5: 1)
                .disabled(newPostData.postTxtTarget == "" ? true: false)
                .opacity(newPostData.postTxtTarget == "" ? 0.5: 1)
                
                
            }
            .padding()
            .background(Color("bg"))
            .shadow(color: Color.white.opacity(0.06), radius: 5, x: 0, y: 5)
            .opacity(newPostData.isPosting ? 0.5 : 1)
            .disabled(newPostData.isPosting ? true: false)

            //HEADER
            HStack(spacing: 20) {
                Text("Title")
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                    .frame(alignment: .leading)
                    .padding(.leading)
                
                
                TextField("Title?", text: $newPostData.postTxtHead)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .frame(height: 40, alignment: .center)
                    .cornerRadius(15)
                    .padding(.trailing)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .modifier(ClearButton(text: $newPostData.postTxtHead))
                    .opacity(newPostData.isPosting ? 0.5 : 1)
                    .disabled(newPostData.isPosting ? true : false)
            }
            .padding(.all, 3)
            .padding(.vertical, 15)

            
            // TARGETS
            HStack(spacing: 20) {
                VStack(spacing: 20) {
                    
                    Button(action: {
                        newPostData.postTxtTarget = "General"
                    }) {
                        Text("General")
                            .bold()
                            .foregroundColor(newPostData.postTxtTarget == "General" ? .green : .gray)
                    }
                    
                    
                    Button(action: {
                        newPostData.postTxtTarget = "Professors"
                    }) {
                        Text("Professors")
                            .bold()
                            .foregroundColor(newPostData.postTxtTarget == "Professors" ? .green : .gray)
                    }
                }
                
                VStack(spacing: 20) {
                    Button(action: {
                        newPostData.postTxtTarget = "Classes"
                    }) {
                        Text("Classes")
                            .bold()
                            .foregroundColor(newPostData.postTxtTarget == "Classes" ? .green : .gray)
                    }
                    
                    Button(action: {
                        newPostData.postTxtTarget = "Research"
                    }) {
                        Text("Research").bold()
                            .foregroundColor(newPostData.postTxtTarget == "Research" ? .green : .gray)
                    }
                    
                    Button(action: {
                        newPostData.postTxtTarget = "Creativity"
                    }) {
                        Text("Creativity").bold()
                            .foregroundColor(newPostData.postTxtTarget == "Creativity" ? .green : .gray)
                    }
                }
                VStack(spacing: 20) {
                    
                    Button(action: {
                        newPostData.postTxtTarget = "QandA"
                    }) {
                        Text("QandA").bold()
                            .foregroundColor(newPostData.postTxtTarget == "QandA" ? .green : .gray)
                    }
                    
                    Button(action: {
                        newPostData.postTxtTarget = "Colleges"
                    }) {
                        Text("Colleges").bold()
                            .foregroundColor(newPostData.postTxtTarget == "Colleges" ? .green : .gray)
                    }
                }
                
                Text("Target")
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                    .frame(alignment: .trailing)
                
            }
            .padding(.all, 3)
            .padding(.vertical, 10)


            

            //INFO
            TextEditor(text: $newPostData.postTxt)
                .foregroundColor(colorScheme == .dark ? .white : .black)
                .cornerRadius(15)
                .frame(minHeight: 40, alignment: .center)
                .padding()
                .opacity(newPostData.isPosting ? 0.5 : 1)
                .disabled(newPostData.isPosting ? true : false)
            
            //IMAGE
            if newPostData.img_Data.count != 0{
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                    Image(uiImage: UIImage(data: newPostData.img_Data)!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width / 2, height: 150)
                        .cornerRadius(15)
                    
                    //cancel button
                    Button(action: {newPostData.img_Data = Data(count: 0)}, label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color(.green))
                            .clipShape(Circle())
                    })
                }
                .padding()
                .opacity(newPostData.isPosting ? 0.5 : 1)
                .disabled(newPostData.isPosting ? true : false)
                
            }
        }
        .navigationBarHidden(true)
        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
        .sheet(isPresented: $newPostData.picker) {
            ImagePicker(picker: $newPostData.picker, img_Data: $newPostData.img_Data)
        }
        
        
    }
    
    public struct ClearButton: ViewModifier {
        @Binding var text: String
        
        public init(text: Binding<String>) {
            self._text = text
        }
        
        public func body(content: Content) -> some View {
            HStack(spacing: 3) {
                content
                // onTapGesture is better than a Button here when adding to a form
                Image(systemName: "multiply.circle.fill")
                    .frame(alignment: .trailing)
                    .padding(.trailing)
                    .foregroundColor(.white)
                    .opacity(text == "" ? 0 : 1)
                    .onTapGesture { self.text = "" }
            }
        }

    }
    
}


//struct NewPost_Previews: PreviewProvider {
//    static var previews: some View {
//        NewPost(, updateId: Binding<String>)
//    }
//}
