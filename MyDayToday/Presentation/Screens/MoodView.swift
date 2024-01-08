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
    
    @State var note: String = ""
    
    var addCallback: (String, String) -> Void
    
    @State private var showNoteView = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.paleBanana)
            
            if !showNoteView {
                showEmojiPickerView()
            } else {
                showNoteViewField()
            }
        }
    }
    
    // MARK: - Methods
    private func proceedNext() {
        if !emoji.isEmpty {
            withAnimation(.spring) {
                showNoteView = true
            }
        }
    }
    
    private func proceedBack() {
        withAnimation(.spring) {
            showNoteView = false
        }
    }
    
    // MARK: - Views
    @ViewBuilder func showEmojiPickerView() -> some View {
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
                proceedNext()
            }, label: {
                Text("Next..")
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
    
    @ViewBuilder func showNoteViewField() -> some View {
        VStack {
            Text("Any thoughts and notes?")
            //TODO: - Make different questions
                .fontDesign(.rounded)
                .fontWeight(.light)
                .font(.system(size: 38))
            
            TextField("Address", text: $note, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Button(action: {
                addCallback(emoji, note)
                emoji = ""
                note = ""
                showNoteView = false
                moodValue = 5.0
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


struct MoodViewPreview: PreviewProvider {
    static var previews: some View {
        MoodView(addCallback: { _, _ in
            
        })
    }
}
