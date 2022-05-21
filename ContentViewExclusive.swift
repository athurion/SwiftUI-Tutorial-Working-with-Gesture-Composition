//
//  ContentView.swift
//  SwiftUI Tutorial: Working with Gesture Composition
//
//  Created by Alvin Sosangyo on 05/21/22.
//

import SwiftUI

struct ContentView: View {

    @State private var textScale = 1.0

    var body: some View {
        ZStack {
            Text("Tap me")
                .font(.system(size: 60))
                .fontWeight(.black)
                .foregroundColor(.white)
                .scaleEffect(textScale)
                .gesture(
                    TapGesture(count: 1)
                        .onEnded({ _ in
                            print("tap works")
                        })
                        .exclusively(
                            before: MagnificationGesture()
                                .onChanged { value in
                                    self.textScale = value.magnitude
                                }
                        )
                )

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.cyan)

    }

} // ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


