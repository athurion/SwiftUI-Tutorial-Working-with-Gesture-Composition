//
//  ContentView.swift
//  SwiftUI Tutorial: Working with Gesture Composition
//
//  Created by Alvin Sosangyo on 05/21/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack {
            Text("Tap me")
                .font(.system(size: 60))
                .fontWeight(.black)
                .foregroundColor(.white)
                .onTapGesture {
                    print("Text is tapped")
                }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.cyan)
        .simultaneousGesture(
            TapGesture()
                .onEnded { _ in
                    print("Stack tapped")
                }
        )
    }
    
} // ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


