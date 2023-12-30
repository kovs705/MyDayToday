//
//  Day.swift
//  MyDayToday
//
//  Created by Eugene Kovs on 11.12.2023.
//

import Foundation
import SwiftData

@Model
final class Day {
    var date: Date
    var feelings: String
    var note: String?
    
    init(date: Date, feelings: String, note: String? = nil) {
        self.date = date
        self.feelings = feelings
        self.note = note
    }
    
}
