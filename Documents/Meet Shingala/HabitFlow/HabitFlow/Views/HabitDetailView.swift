//
//  HabitDetailView.swift
//  HabitFlow
//
//  Drill-in screen for a single habit: bigger streak display,
//  a month-style completion grid, and a delete action.
//

import SwiftUI

struct HabitDetailView: View {
    let habit: Habit
    let onToggle: () -> Void
    let onDelete: () -> Void

    @Environment(\.dismiss) private var dismiss
    @State private var showDeleteConfirm = false

    private var accent: Color { Color(hex: habit.colorHex) }

    var body: some View {
        ScrollView {
            VStack(spacing: 28) {
                header

                statsRow

                monthGrid

                Button(role: .destructive) {
                    showDeleteConfirm = true
                } label: {
                    Label("Delete Habit", systemImage: "trash")
                        .font(.system(.subheadline, design: .rounded, weight: .semibold))
                }
                .padding(.top, 8)
            }
            .padding()
        }
        .navigationTitle(habit.name)
        .navigationBarTitleDisplayMode(.inline)
        .confirmationDialog(
            "Delete \"\(habit.name)\"?",
            isPresented: $showDeleteConfirm,
            titleVisibility: .visible
        ) {
            Button("Delete", role: .destructive) {
                onDelete()
                dismiss()
            }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("This can't be undone.")
        }
    }

    private var header: some View {
        VStack(spacing: 12) {
            Image(systemName: habit.iconName)
                .font(.system(size: 34, weight: .semibold))
                .foregroundStyle(accent)
                .frame(width: 76, height: 76)
                .background(accent.opacity(0.15), in: Circle())

            Button(action: {
                withAnimation(.spring(response: 0.35, dampingFraction: 0.6)) {
                    onToggle()
                }
            }) {
                Text(habit.isCompletedToday ? "Completed Today" : "Mark Today Complete")
                    .font(.system(.subheadline, design: .rounded, weight: .semibold))
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(habit.isCompletedToday ? accent : accent.opacity(0.15), in: Capsule())
                    .foregroundStyle(habit.isCompletedToday ? .white : accent)
            }
            .buttonStyle(.plain)
        }
        .padding(.top, 12)
    }

    private var statsRow: some View {
        HStack(spacing: 12) {
            StatCard(title: "Current Streak", value: "\(habit.currentStreak)", icon: "flame.fill", accent: .orange)
            StatCard(title: "Total Days", value: "\(habit.completedDates.count)", icon: "calendar", accent: accent)
        }
    }

    private var monthGrid: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Last 28 Days")
                .font(.system(.subheadline, design: .rounded, weight: .semibold))
                .foregroundStyle(.secondary)

            let days = lastNDays(28)
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 6), count: 7), spacing: 6) {
                ForEach(days, id: \.self) { day in
                    let done = isCompleted(day)
                    RoundedRectangle(cornerRadius: 6, style: .continuous)
                        .fill(done ? accent : Color.primary.opacity(0.08))
                        .frame(height: 28)
                }
            }
        }
        .padding(16)
        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
    }

    private func lastNDays(_ n: Int) -> [Date] {
        let calendar = Calendar.current
        return (0..<n).reversed().map {
            calendar.date(byAdding: .day, value: -$0, to: calendar.startOfDay(for: .now))!
        }
    }

    private func isCompleted(_ date: Date) -> Bool {
        let calendar = Calendar.current
        return habit.completedDates.contains { calendar.isDate($0, inSameDayAs: date) }
    }
}

private struct StatCard: View {
    let title: String
    let value: String
    let icon: String
    let accent: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Image(systemName: icon)
                .foregroundStyle(accent)
            Text(value)
                .font(.system(.title2, design: .rounded, weight: .bold))
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(14)
        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

#Preview {
    NavigationStack {
        HabitDetailView(
            habit: Habit(name: "Read", iconName: "book.fill", colorHex: "9B51E0"),
            onToggle: {},
            onDelete: {}
        )
    }
}
