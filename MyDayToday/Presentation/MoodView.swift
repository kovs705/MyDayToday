//
//  MoodView.swift
//  MyDayToday
//
//  Created by Eugene Kovs on 12.12.2023.
//

import SwiftUI

struct MoodView: View {
    
    @State var moodValue: Double = 5.0
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.paleBanana)
            
            VStack {
                Spacer()
                
                Text("What's your mood for today?")
                //TODO: - Make different questions
                    .fontDesign(.rounded)
                    .fontWeight(.light)
                    .font(.system(size: 38))
                
                MoodSlider(value: $moodValue)
                    .frame(height: 30)
            }
            
            
            
        }
    }
}


struct MoodViewPreview: PreviewProvider {
    static var previews: some View {
        MoodView()
    }
}
