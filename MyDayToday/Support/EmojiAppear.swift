//
//  EmojiAppear.swift
//  MyDayToday
//
//  Created by Eugene Kovs on 14.12.2023.
//

import SwiftUI

struct EmojiAppearModifier: ViewModifier {
    
    @State var opacity: CGFloat = 0
    @State private var yCoordinate: CGFloat = 40
    var duration: CGFloat = 0.5
    @Binding var onDissapearToggle: Bool
    @State private var emojiSize: CGFloat = 16
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: emojiSize))
            .opacity(opacity)
            .offset(y: yCoordinate)
            .onAppear {
                withAnimation(.interactiveSpring(duration: duration)) {
                    yCoordinate = 0
                    opacity = 1
                    emojiSize = 60
                }
            }
            
            .onChange(of: onDissapearToggle) { _, newValue in
                if newValue == false {
                    withAnimation(.interactiveSpring(duration: duration)) {
                        yCoordinate = 40
                        opacity = 0
                        emojiSize = 16
                    }
                } else {
                    withAnimation(.interactiveSpring(duration: duration)) {
                        yCoordinate = 0
                        opacity = 1
                        emojiSize = 60
                    }
                }
            }
    }
}

struct EmojiAppearModifierPreview: PreviewProvider {
    
    @State static var toggle = false
    
    static var previews: some View {
        Text("😘")
            .font(.system(size: 60))
            .modifier(EmojiAppearModifier(onDissapearToggle: $toggle))
    }
}
