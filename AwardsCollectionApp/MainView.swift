//
//  MainView.swift
//  AwardsCollectionApp
//
//  Created by Alexey Efimov on 17.06.2021.
//

import SwiftUI

struct MainView: View {
    @State private var showAward = false
    
    var body: some View {
        VStack {
            Button(action: buttonAction) {
                HStack {
                    Text(showAward ? "Hide Award" : "Show Award")
                    Spacer()
                    Image(systemName: "chevron.up.square")
                        .rotationEffect(.degrees(showAward ? 0 : 180))
                        .scaleEffect(showAward ? 2 : 1)
                        
                }
            }
            
            Spacer()
            if showAward {
                SwiftLogoView()
                    .frame(width: 250, height: 250)
                    .transition(.scaleSlide)
                    .rotationEffect(.degrees(showAward ? 0 : 180))
            }
            Spacer()
        }
        .font(.headline)
        .padding()
    }
    
    private func buttonAction() {
        withAnimation {
            showAward.toggle()
        }
    }
}

extension AnyTransition {
    static var scaleSlide: AnyTransition {
        let insertion = AnyTransition.scale
            .combined(with: .opacity)
        let removal = AnyTransition.slide
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
