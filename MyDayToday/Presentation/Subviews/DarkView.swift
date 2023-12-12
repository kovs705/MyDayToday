//
//  DarkView.swift
//  MyDayToday
//
//  Created by Eugene Kovs on 12.12.2023.
//

import SwiftUI

struct DarkView: View {
    @Binding var isDark: Bool
    
    var body: some View {
        Color.black
            .opacity(isDark ? 0.7 : 0)
    }
}
