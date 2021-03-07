//
//  ScrollableTabBar.swift
//  Gatton
//
//  Created by Andrew Park on 3/5/21.
//

import SwiftUI

struct ScrollableTabBar<Content: View>: UIViewRepresentable {

    
    var content: Content
    
    var rect: CGRect
    @Binding var offset: CGFloat
    var tabs: [Any]
    
    let scrollView = UIScrollView()
    
    init(tabs: [Any], rect: CGRect, offset: Binding<CGFloat>,@ViewBuilder content: ()-> Content) {
        self.content = content()
        self._offset = offset
        self.rect = rect
        self.tabs = tabs
    }
    
    func makeCoordinator() -> Coordinator {
        return ScrollableTabBar.Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        setUpScrollView()
        
        scrollView.contentSize = CGSize(width: rect.width * CGFloat(tabs.count), height: rect.height)
        
        scrollView.addSubview(extractView())
        
        scrollView.delegate = context.coordinator
        
        return scrollView
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        if uiView.contentOffset.x != offset {
//            uiView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
            
            uiView.delegate = nil
            UIView.animate(withDuration: 0.4) {
                uiView.contentOffset.x = offset
            } completion: { (status) in
                if status{uiView.delegate = context.coordinator}
            }
            
        }
        
    }
    
    func setUpScrollView() {
        scrollView.isPagingEnabled = true
        scrollView.bounces = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
    }
    
    func extractView()->UIView {
        let controller = UIHostingController(rootView: content)
        controller.view.frame = CGRect(x: 0, y: 0, width: rect.width * CGFloat(tabs.count), height: rect.height)
        
        return controller.view!
    }
    
    class Coordinator: NSObject, UIScrollViewDelegate {
        var parent: ScrollableTabBar
        
        init(parent: ScrollableTabBar) {
            self.parent = parent        }
        
        func scrollViewDidZoom(_ scrollView: UIScrollView) {
            parent.offset = scrollView.contentOffset.x
        }
    }
    
}



struct ScrollableTabBar_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
