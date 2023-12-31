//
//  MyDayTodayApp.swift
//  MyDayToday
//
//  Created by Eugene Kovs on 11.12.2023.
//

import SwiftUI
import SwiftData

@main
struct MyDayTodayApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Day.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
