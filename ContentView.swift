//
//  ContentView.swift
//  SwiftUI Tutorial: Working with Gesture Composition
//
//  Created by Alvin Sosangyo on 05/21/22.
//

import SwiftUI

struct ContentView: View {
    
    @GestureState private var dragOffset = CGSize.zero
    @State private var position = CGSize.zero
    @State private var isLongPressed = false
    
    var body: some View {
        
        Image("carl-heyerdahl")
            .resizable()
            .frame(width: 200, height: 100)
            .opacity(isLongPressed ? 0.5 : 1.0)
            .offset(x: position.width + dragOffset.width, y: position.height + dragOffset.height)
            .gesture(
                LongPressGesture(minimumDuration: 0.5)
                    .onEnded { current in
                        isLongPressed = current
                    }
                    .sequenced(before: DragGesture())
                    .updating($dragOffset, body: { (value, state, transaction) in
                        
                        switch value {
                        case .first(true):
                            print("Image is tapped")
                        case .second(true, let dragValue):
                            state = dragValue?.translation ?? .zero
                        default:
                            break
                        }
                        
                    })
                    .onEnded { value in
                        
                        guard case .second(true, let dragValue?) = value else { return }
                        
                        self.position.height += dragValue.translation.height
                        self.position.width += dragValue.translation.width
                        
                        isLongPressed = false
                        
                    }
            )
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


