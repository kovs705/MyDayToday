//
//  MoodView.swift
//  MyDayToday
//
//  Created by Eugene Kovs on 12.12.2023.
//

import SwiftUI

struct MoodView: View {
    
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.paleBanana)
            
            Text("What's your mood for today?")
            //TODO: - Make different questions
                .fontDesign(.rounded)
                .fontWeight(.light)
                .font(.system(size: 38))
            
        }
    }
}


struct MoodViewPreview: PreviewProvider {
    static var previews: some View {
        MoodView()
    }
}
