//
//  ContentView.swift
//  CDLoadingAnimation
//
//  Created by Christophe Dellac on 4/13/20.
//  Copyright © 2020 Christophe Dellac. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var imageName: String? = nil
    
    var body: some View {
        NavigationView {
            
            CDLoadingAnimationCard(imageName: self.imageName)
            
        }
        .navigationBarTitle("CD Loading Animation", displayMode: .inline)
        .onAppear() {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                
                withAnimation(Animation.default) {
                    self.imageName = "loadedImage"
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
