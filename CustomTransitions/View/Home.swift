//
//  Home.swift
//  CustomTransitions
//
//  Created by Danil Peregorodiev on 25.02.2022.
//

import SwiftUI

struct Home: View {
    @State var show: Bool = false
    var body: some View {
        GeometryReader {proxy in
            let size = proxy.size
            
            CubicTransition(show: $show) {
                ZStack {
                    Image("pic1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height)
                        .clipped()
                    
                    Button {
                        
                    } label: {
                        
                        Text("Navigate")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding()
                            .background(.ultraThinMaterial)
                            .cornerRadius(10)
                            .environment(\.colorScheme, .dark)
                    }
                }
            } detail: {
                Image("pic2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                    .clipped()
            }
        }
        .ignoresSafeArea()
        .overlay(alignment: .top) {
            HStack(spacing: 12) {
                Text("Custom Transition")
                    .font(.title.bold())
                    .foregroundColor(.white)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
