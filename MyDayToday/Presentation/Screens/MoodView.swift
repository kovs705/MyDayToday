//
//  MoodView.swift
//  MyDayToday
//
//  Created by Eugene Kovs on 12.12.2023.
//

import SwiftUI

struct MoodView: View {
    
    @State var moodValue: Double = 5.0
    @State var emoji: String = ""
    var addCallback: (String) -> Void
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.paleBanana)
            
            VStack {
                Text("What's your mood for today?")
                //TODO: - Make different questions
                    .fontDesign(.rounded)
                    .fontWeight(.light)
                    .font(.system(size: 38))
                
                MoodSlider(value: $moodValue, emoji: $emoji)
                    .frame(height: 30)
                    .padding(.top, 30)
                            
                Button(action: {
                    addCallback(emoji)
                }, label: {
                    Text("Добавить \(emoji)")
                        .foregroundStyle(.white)
                        .padding()
                        .background(
                            Capsule()
                                .fill(.black)
                                .frame(width: 130, height: 45, alignment: .center)
                        )
                })
                .padding(.top, 25)
            }
            
            
        }
    }
}


struct MoodViewPreview: PreviewProvider {
    static var previews: some View {
        MoodView(addCallback: { _ in
            
        })
    }
}
