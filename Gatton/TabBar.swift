//
//  TabBar.swift
//  Gatton
//
//  Created by Andrew Park on 3/5/21.
//

import SwiftUI

struct TabBar: View {
    @Binding var offset: CGFloat
    @State var width: CGFloat = 0
    var body: some View {
        GeometryReader { proxy -> AnyView in
            
            let equalWidth = proxy.frame(in: .global).width / CGFloat(tabs.count)
            
            DispatchQueue.main.async {
                self.width = equalWidth
            }
            
            return AnyView (
                ZStack(alignment: .bottom) {
                    Capsule()
                        .fill(Color.blue)
                        .frame(width: equalWidth - 15, height: 4)
                        .offset(x: getOffset() + 7, y: 4)
                     
                    HStack(spacing: 0) {
                        ForEach(tabs.indices, id: \.self) { index in
                            Text(tabs[index])
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(width: equalWidth, height: 40)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    withAnimation{
                                        offset = UIScreen.main.bounds.width * CGFloat(index)
                                    }
                                }
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 40, alignment: .center)
                .clipShape(Capsule())
            )

        }
        .padding()
        .frame(height: 40)
    }
    
    func getOffset() -> CGFloat {
        let progress = offset / UIScreen.main.bounds.width
        return progress * width
    }
    
    
    
}

//struct TabBar_Previews: PreviewProvider {
//    static var previews: some View {
//        TabBar()
//    }
//}
