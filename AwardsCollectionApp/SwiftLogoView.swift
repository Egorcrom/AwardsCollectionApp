//
//  SwiftLogoView.swift
//  AwardsCollectionApp
//
//  Created by Егор Кромин on 08.02.2022.
//

import SwiftUI

struct SwiftLogoView: View {
    
    @State private var rotation: CGFloat = 0.0
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            ZStack {
                ForEach(0..<20) { iteration in
                    Rectangle()
                        .fill(
                            LinearGradient(
                                colors: [.red, .blue],
                                startPoint: UnitPoint(x: 0, y: 1),
                                endPoint: UnitPoint(x: 1, y: 0)
                            )
                        )
                        .rotationEffect(.degrees(Double(iteration) * 59))
                        .frame(
                            width: width * 0.7,
                            height: height * 0.7
                        )
                }
                .blendMode(.hardLight)
                
                .rotationEffect(.degrees(rotation))
                .animation(Animation.easeInOut(duration: 1)
                            .repeatForever(autoreverses: true))
                
                Circle()
                    .foregroundColor(.gray)
                    .opacity(0.3)
                
                Circle()
                    .frame(
                        width: width * 0.8,
                        height: height * 0.8
                    )
                    .foregroundColor(.orange)
                    .shadow(radius: 10)
            
                Image(systemName: "swift")
                    .resizable()
                    .frame(
                        width: width * 0.8,
                        height: height * 0.8
                    )
                    .opacity(0.9)
                    .scaleEffect(0.7)
                    .foregroundColor(.white)
            }
        }
        .onAppear{
            self.rotation = 90
        }
    }
    
}

struct MyElementView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftLogoView()
            .frame(width: 200, height: 200)
    }
}
