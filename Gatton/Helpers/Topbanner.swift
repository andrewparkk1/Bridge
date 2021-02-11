//
//  Topbanner.swift
//  Gatton
//
//  Created by Andrew Park on 1/10/21.
//

import SwiftUI

class Host: UIHostingController<ContentView> {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

struct Topbanner: View {
    @Binding var top: Int
    
    
    var body: some View {
        //Rectangle().foregroundColor(.green)
        VStack() {
            Text("Gatton")
            HStack {
                Button(action: {
                    self.top = 0
                    
                }, label: {
                    Text("Search")
                        .foregroundColor(self.top == 0 ? .gray : Color.gray.opacity(0.45))
                        .fontWeight(self.top == 0 ? .bold : .none)
                        .padding(.top, 2.5)
                        .padding(.trailing, 5)
                })
                
                Text("|").foregroundColor(.gray).opacity(0.45)
                
                
                Button(action: {
                    self.top = 1
                }, label: {
                    Text("Feed")
                        .foregroundColor(self.top == 1 ? .gray : Color.gray.opacity(0.45))
                        .fontWeight(self.top == 1 ? .bold : .none)
                        .padding(.top, 2.5)
                        .padding(.leading, 5)
                    
                })
            }
        }
        /*
        .padding()
        .padding(.top, (UIApplication.shared.windows.last?.safeAreaInsets.top)! + 10)
        .background(Color("green"))
 */
    }
}


struct Topbanner_Previews: PreviewProvider {
    static var previews: some View {
        Topbanner(top: .constant(0))
    }
}
