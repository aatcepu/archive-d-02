//
//  HabitRowView.swift
//  HabitFlow
//
//  A single habit card: icon, name, streak, mini 7-day history,
//  and a tap-to-complete button with a satisfying pop animation.
//

import SwiftUI

struct HabitRowView: View {
    let habit: Habit
    let onToggle: () -> Void

    private var accent: Color { Color(hex: habit.colorHex) }

    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: habit.iconName)
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(accent)
                .frame(width: 44, height: 44)
                .background(accent.opacity(0.15), in: RoundedRectangle(cornerRadius: 12, style: .continuous))

            VStack(alignment: .leading, spacing: 6) {
                Text(habit.name)
                    .font(.system(.headline, design: .rounded))
                    .foregroundStyle(.primary)

                HStack(spacing: 8) {
                    if habit.currentStreak > 0 {
                        Label("\(habit.currentStreak)", systemImage: "flame.fill")
                            .font(.system(.caption, design: .rounded, weight: .semibold))
                            .foregroundStyle(.orange)
                    }
                    WeekDotsView(days: habit.lastSevenDays(), accent: accent)
                }
            }

            Spacer()

            CompletionButton(isCompleted: habit.isCompletedToday, accent: accent, action: onToggle)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 14)
        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .strokeBorder(Color.primary.opacity(0.05), lineWidth: 1)
        )
    }
}

/// Seven small dots representing the last week, filled in the habit's accent color.
private struct WeekDotsView: View {
    let days: [(date: Date, done: Bool)]
    let accent: Color

    var body: some View {
        HStack(spacing: 4) {
            ForEach(days, id: \.date) { day in
                Circle()
                    .fill(day.done ? accent : Color.primary.opacity(0.12))
                    .frame(width: 6, height: 6)
            }
        }
    }
}

/// The circular tap target that marks a habit done for today, with a spring
/// animation and haptic feedback (triggered by the parent's onToggle).
private struct CompletionButton: View {
    let isCompleted: Bool
    let accent: Color
    let action: () -> Void

    var body: some View {
        Button(action: {
            withAnimation(.spring(response: 0.35, dampingFraction: 0.6)) {
                action()
            }
        }) {
            ZStack {
                Circle()
                    .strokeBorder(isCompleted ? Color.clear : Color.primary.opacity(0.2), lineWidth: 2)
                    .background(Circle().fill(isCompleted ? accent : Color.clear))
                    .frame(width: 32, height: 32)

                if isCompleted {
                    Image(systemName: "checkmark")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(.white)
                        .transition(.scale.combined(with: .opacity))
                }
            }
        }
        .buttonStyle(.plain)
        .scaleEffect(isCompleted ? 1.05 : 1.0)
        .animation(.spring(response: 0.35, dampingFraction: 0.6), value: isCompleted)
    }
}

#Preview {
    HabitRowView(
        habit: Habit(name: "Drink Water", iconName: "drop.fill", colorHex: "5B8DEF"),
        onToggle: {}
    )
    .padding()
}
