//
//  CustomSlider.swift
//  MyDayToday
//
//  Created by Eugene Kovs on 12.12.2023.
//

import SwiftUI

struct MoodSlider: View {
    @Binding var value: Double
    
    @State var lastCoordinateValue: CGFloat = 0.0
    var sliderRange: ClosedRange<Double> = 1...17
    
    @State private var emoji: String = "🙂"
    
    var body: some View {
        GeometryReader { gr in
            let thumbSize = gr.size.height * 0.8
            let radius = gr.size.height * 0.5
            let minValue = gr.size.width * 0.015
            let maxValue = (gr.size.width * 0.98) - thumbSize
            
            let scaleFactor = (maxValue - minValue) / (sliderRange.upperBound - sliderRange.lowerBound)
            let lower = sliderRange.lowerBound
            
            let sliderVal = (self.value - lower) * scaleFactor + minValue
            
            ZStack {
                RoundedRectangle(cornerRadius: radius)
                    .frame(height: 7)
                    .foregroundColor(Color.init(uiColor: .systemGray4))
                HStack {
                    Circle()
                        .foregroundColor(Color.yellow)
                        .frame(width: thumbSize, height: thumbSize)
                        .offset(x: sliderVal)
                        .gesture (
                            DragGesture(minimumDistance: 0)
                                .onChanged { v in
                                    if (abs(v.translation.width) < 0.1) {
                                        self.lastCoordinateValue = sliderVal
                                    }
                                    if v.translation.width > 0 {
                                        let nextCoordinateValue = min (maxValue, self.lastCoordinateValue + v.translation.width)
                                        self.value = ( (nextCoordinateValue - minValue) / scaleFactor) + lower
                                    } else {
                                        let nextCoordinateValue = max (minValue, self.lastCoordinateValue + v.translation.width)
                                        self.value = ((nextCoordinateValue - minValue) / scaleFactor) + lower
                                    }
                                }
                        )
                    Spacer()
                }
            }
        }
    }
    
    func sliderRangeListener() {
        switch value {
        case 1:
            emoji = "😩"
        case 2:
            emoji = "😣"
        case 3:
            emoji = "😔"
        case 4:
            emoji = "😟"
        case 5:
            emoji = "😒"
        case 6:
            emoji = "😕"
        case 7:
            emoji = "😐"
        case 8:
            emoji = "🫨"
        case 9:
            emoji = "😳"
        case 10:
            emoji = "🤔"
        case 11:
            emoji = "🤒"
        case 12:
            emoji = "🫠"
        case 13:
            emoji = "🙂"
        case 14:
            emoji = "😉"
        case 15:
            emoji = "😊"
        case 16:
            emoji = "😝"
        case 17:
            emoji = "🤩"
        default:
            emoji = "🤔"
        }
    }
}

struct SliderPreview: PreviewProvider {
    
    @State static var num = 6.0
    
    static var previews: some View {
        MoodSlider(value: $num)
            .frame(width: 300, height: 30)
    }
}

