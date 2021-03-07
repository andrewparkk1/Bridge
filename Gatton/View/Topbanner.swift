////
////  Topbanner.swift
////  Gatton
////
////  Created by Andrew Park on 1/10/21.
////
//
import SwiftUI
//
//class Host: UIHostingController<ContentView> {
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
//}

struct Topbanner: View {
    @Binding var top: Int
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @StateObject var postData = PostViewModel()
    
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "square.and.pencil")
                .foregroundColor(Color("bg"))

            Spacer()
            Button(action: {
                self.top = 0
                
            }, label: {
                Text("Creativity")
                    .font(.title2)
                    .foregroundColor(self.top == 0 ? .green : Color.gray.opacity(0.45))
                    .fontWeight(self.top == 0 ? .bold : .none)
                    .padding(.trailing, 5)
            })
            
            Text("|").foregroundColor(.white).opacity(0.45)
            
            
            Button(action: {
                self.top = 1
            }, label: {
                Text("Feed")
                    .font(.title2)
                    .foregroundColor(self.top == 1 ? .green : Color.gray.opacity(0.45))
                    .fontWeight(self.top == 1 ? .bold : .none)
                    .padding(.leading, 5)
                
            })
            Spacer()
            Button(action: {postData.newPost.toggle()}) {
                Image(systemName: "square.and.pencil")
                    .font(.title)
                    .foregroundColor(.white)
            }
            
        }
        .fullScreenCover(isPresented: $postData.newPost, content: {
            NewPostHome(updateId: $postData.updateId)
        })
        /*
         .padding()
         .padding(.top, (UIApplication.shared.windows.last?.safeAreaInsets.top)! + 10)
         .background(Color("green"))
         */
    }
}

//
//struct Topbanner_Previews: PreviewProvider {
//    static var previews: some View {
//        Topbanner(top: .constant(0))
//    }
//}
