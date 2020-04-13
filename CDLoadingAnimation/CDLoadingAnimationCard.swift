//
//  CDLoadingAnimationCard.swift
//  CDLoadingAnimation
//
//  Created by Christophe Dellac on 4/13/20.
//  Copyright © 2020 Christophe Dellac. All rights reserved.
//

import SwiftUI

struct CDLoadingAnimationCard: View {
    
    @State private var animated = false
    
    let animationOffset = (UIScreen.main.bounds.width / 1.3)
    let cornerRadius: CGFloat = 15.0
    
    let imageName: String?
    
    var body: some View {
        VStack {
            
            /// Check if the content of this card is loaded yet or not
            if imageName == nil {
                ZStack {
                    
                    /// The background card
                    Color.black.opacity(0.1)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .cornerRadius(self.cornerRadius)
                    
                    /// The overlay card with mask
                    Color.white
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .cornerRadius(self.cornerRadius)
                        .mask(
                            RoundedRectangle(cornerRadius: self.cornerRadius)
                                .fill(
                                    
                                    LinearGradient(gradient: .init(colors: [.clear, Color.white.opacity(0.35), .clear]),
                                                   startPoint: .top, endPoint: .bottom)
                                    
                            )
                                .rotationEffect(Angle(degrees: 70))
                                .offset(x: self.animated ? animationOffset: -animationOffset)
                    )
                    
                    Text("Loading image ...")
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                        .shadow(color: Color.white.opacity(0.7), radius: 5, x: -5, y: -5)
                        .shadow(color: Color.black.opacity(0.08), radius: 8, x: 5, y: 5)
                }
            }
            else {
                VStack {
                    /// Your content here
                    Image(self.imageName!)
                        .resizable()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .cornerRadius(self.cornerRadius)
                }
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: 250)
        .padding()
        .onAppear() {
            withAnimation(Animation.default.speed(0.20).delay(0).repeatForever(autoreverses: false)) {
                
                self.animated.toggle()
                
            }
        }
    }

}

struct CDLoadingAnimationCard_Previews: PreviewProvider {
    static var previews: some View {
        CDLoadingAnimationCard(imageName: nil)
    }
}
