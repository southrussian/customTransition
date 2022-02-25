//
//  CubicTransition.swift
//  CustomTransitions
//
//  Created by Danil Peregorodiev on 25.02.2022.
//

import SwiftUI

struct CubicTransition<Content: View, Detail: View>: View {
    var content: Content
    var detail: Detail
    
    @Binding var show: Bool
    
    init(show: Binding<Bool>, @ViewBuilder content: @escaping ()->Content, @ViewBuilder detail: @escaping ()->Detail) {
        self.detail = detail()
        self.content = content()
        self._show = show
    }
    
    @State var animateView: Bool = false
    @State var showView: Bool = false
    
    var body: some View {
    
        GeometryReader {proxy in
            let size = proxy.size
            
            HStack(spacing: 0) {
                content
                    .frame(width: size.width, height: size.height)
                    .rotation3DEffect(.init(degrees: animateView ? -85 : 0), axis: (x: 0, y: 1, z: 0), anchor: .trailing, anchorZ: 0, perspective: 1)
                
                ZStack {
                    if showView {
                        detail
                            .frame(width: size.width, height: size.height)
                            .transition(.move(edge: .trailing))
                    }
                }
                .rotation3DEffect(.init(degrees: animateView ? 0 : 85), axis: (x: 0, y: 1, z: 0), anchor: .leading, anchorZ: 0, perspective: 1)
            }
            .offset(x: animateView ? -size.width : 0)
        }
        .onChange(of: show) { newValue in
            
            if show{showView = true}
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                withAnimation(.easeInOut(duration: 0.35)) {
                    animateView.toggle()
                }
            }
        }
    }
}

struct CubicTransition_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
