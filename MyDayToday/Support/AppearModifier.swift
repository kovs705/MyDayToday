//
//  AppearModifier.swift
//  MyDayToday
//
//  Created by Eugene Kovs on 11.12.2023.
//

import SwiftUI

struct AppearModifier: ViewModifier {
    
    @State var opacity: CGFloat = 0
    @State private var yCoordinate: CGFloat = 20
    var duration: CGFloat = 1
    @Binding var onDissapearToggle: Bool
    
    func body(content: Content) -> some View {
        content
            .opacity(opacity)
            .offset(y: yCoordinate)
            .onAppear {
                onDissapearToggle = false
                withAnimation(.interactiveSpring(duration: duration)) {
                    yCoordinate = 0
                    opacity = 1
                }
            }
            
            .onChange(of: onDissapearToggle) { _, newValue in
                if newValue == true {
                    withAnimation(.interactiveSpring(duration: duration)) {
                        yCoordinate = 20
                        opacity = 0
                    }
                }
            }
    }
}

struct PreviewOfModifier: PreviewProvider {
    
    @State static var toggle = false
    
    static var previews: some View {
        Text("Hello")
            .font(.system(size: 22))
            .modifier(AppearModifier(onDissapearToggle: $toggle))
    }
}
