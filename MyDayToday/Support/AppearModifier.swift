//
//  AppearModifier.swift
//  MyDayToday
//
//  Created by Eugene Kovs on 11.12.2023.
//

import SwiftUI

struct AppearModifier: ViewModifier {
    
    @State var opacity: CGFloat = 0
    @State var yCoordinate: CGFloat = 20
    var duration: CGFloat = 2
    
    func body(content: Content) -> some View {
        content
            .opacity(opacity)
            .offset(y: yCoordinate)
            .onAppear {
                withAnimation(.interactiveSpring(duration: duration)) {
                    yCoordinate = 0
                    opacity = 1
                }
            }
    }
}

struct PreviewOfModifier: PreviewProvider {
    static var previews: some View {
        Text("Hello")
            .font(.system(size: 22))
            .modifier(AppearModifier())
    }
}
