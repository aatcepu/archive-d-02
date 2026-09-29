//
//  HabitListViewModel.swift
//  HabitFlow
//
//  Thin orchestration layer between the SwiftData context and the views.
//  Keeps views free of persistence/business logic per MVVM.
//

import Foundation
import SwiftData
import UIKit

@Observable
final class HabitListViewModel {
    private let modelContext: ModelContext

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    func addHabit(name: String, iconName: String, colorHex: String) {
        let trimmed = name.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }

        let habit = Habit(name: trimmed, iconName: iconName, colorHex: colorHex)
        modelContext.insert(habit)
        save()

        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }

    func toggleCompletion(for habit: Habit) {
        habit.toggleToday()
        save()

        let generator = UIImpactFeedbackGenerator(style: habit.isCompletedToday ? .medium : .light)
        generator.impactOccurred()
    }

    func delete(_ habit: Habit) {
        modelContext.delete(habit)
        save()
    }

    private func save() {
        do {
            try modelContext.save()
        } catch {
            // In a production app this would surface to the user or a logger.
            print("HabitFlow save error: \(error)")
        }
    }
}
