//
//  NewPost.swift
//  Gatton
//
//  Created by Andrew Park on 2/17/21.
//

//CHECKED

import SwiftUI

struct NewPost: View {
    @StateObject var newPostData = NewPostModel()
    @Environment(\.presentationMode) var present
    @Binding var updateId: String
    
    
    var body: some View {
        VStack{
            HStack(spacing: 15){
                Button(action: {
                    self.updateId = ""
                    present.wrappedValue.dismiss()
                }, label: {
                    Text("Cancel")
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                })
                
                Spacer(minLength: 0)
                
                if updateId == ""{
                    //only for new posts
                    Button(action: {newPostData.picker.toggle()}, label: {
                        Image(systemName: "photo.fill")
                            .font(.title)
                            .foregroundColor(.green)
                    })
                }
                
                Button(action: {newPostData.post(updateId: updateId, present: present)}, label: {
                    Text("Post")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
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
            .opacity(newPostData.isPosting ? 0.5: 1)
            .disabled(newPostData.isPosting ? true: false)
            
            //HEADER
            TextEditor(text: $newPostData.postTxtHead)
                .foregroundColor(.black)
                .accentColor(.white)
                .frame(height: 40, alignment: .center)
                .cornerRadius(15)
                .padding()
                .opacity(newPostData.isPosting ? 0.5 : 1)
                .disabled(newPostData.isPosting ? true : false)
            
            //TARGET
            TextEditor(text: $newPostData.postTxtTarget)
                .cornerRadius(15)
                .frame(height: 40, alignment: .center)
                .padding()
                .opacity(newPostData.isPosting ? 0.5 : 1)
                .disabled(newPostData.isPosting ? true : false)
            
            //INFO
            TextEditor(text: $newPostData.postTxt)
                .cornerRadius(15)
                .padding()
                .opacity(newPostData.isPosting ? 0.5 : 1)
                .disabled(newPostData.isPosting ? true : false)
            
            //display image if its selected
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
        .background(Color("bg").ignoresSafeArea(.all, edges: .all))
        .sheet(isPresented: $newPostData.picker) {
            ImagePicker(picker: $newPostData.picker, img_Data: $newPostData.img_Data)
        }
        
    }
}


//
//struct NewPost_Previews: PreviewProvider {
//    static var previews: some View {
//        NewPost(, updateId: Binding<String>)
//    }
//}
