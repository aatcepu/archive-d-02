//
//  Habit.swift
//  HabitFlow
//
//  Core data model for a habit, persisted via SwiftData.
//

import Foundation
import SwiftData

@Model
final class Habit {
    var name: String
    var iconName: String
    var colorHex: String
    var createdAt: Date
    /// Store one Date per day the habit was completed (normalized to start of day).
    var completedDates: [Date]

    init(
        name: String,
        iconName: String = "checkmark.circle.fill",
        colorHex: String = "5B8DEF",
        createdAt: Date = .now,
        completedDates: [Date] = []
    ) {
        self.name = name
        self.iconName = iconName
        self.colorHex = colorHex
        self.createdAt = createdAt
        self.completedDates = completedDates
    }

    // MARK: - Derived state

    var isCompletedToday: Bool {
        completedDates.contains { Calendar.current.isDateInToday($0) }
    }

    /// Current streak counting backwards from today (or yesterday if today isn't done yet).
    var currentStreak: Int {
        let calendar = Calendar.current
        let normalized = Set(completedDates.map { calendar.startOfDay(for: $0) })
        guard !normalized.isEmpty else { return 0 }

        var streak = 0
        var cursor = calendar.startOfDay(for: .now)

        // If today isn't logged yet, start counting from yesterday so an
        // in-progress streak still shows correctly before the user checks in.
        if !normalized.contains(cursor) {
            cursor = calendar.date(byAdding: .day, value: -1, to: cursor)!
        }

        while normalized.contains(cursor) {
            streak += 1
            cursor = calendar.date(byAdding: .day, value: -1, to: cursor)!
        }
        return streak
    }

    /// Completion for the last 7 days, oldest first — used by the mini calendar row.
    func lastSevenDays() -> [(date: Date, done: Bool)] {
        let calendar = Calendar.current
        let normalized = Set(completedDates.map { calendar.startOfDay(for: $0) })
        return (0..<7).reversed().map { offset in
            let day = calendar.date(byAdding: .day, value: -offset, to: calendar.startOfDay(for: .now))!
            return (day, normalized.contains(day))
        }
    }

    func toggleToday() {
        let calendar = Calendar.current
        if let idx = completedDates.firstIndex(where: { calendar.isDateInToday($0) }) {
            completedDates.remove(at: idx)
        } else {
            completedDates.append(calendar.startOfDay(for: .now))
        }
    }
}
