//
//  HabitFlowApp.swift
//  HabitFlow
//
//  App entry point. Sets up the SwiftData model container that backs
//  every Habit across launches.
//

import SwiftUI
import SwiftData

@main
struct HabitFlowApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Habit.self)
    }
}
