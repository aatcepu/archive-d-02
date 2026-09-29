//
//  HabitFlow.swift
//  HabitFlow — single-file version
//
//  A minimalist habit tracker built with SwiftUI + SwiftData.
//  Everything (Model, ViewModel, Views, App entry point) lives in this
//  one file for easy drag-and-drop into a single-file Xcode project.
//
//  Requires iOS 17+ / Xcode 15+ (SwiftData).
//

import SwiftUI
import SwiftData
import UIKit

// MARK: - Extensions

extension Color {
    init(hex: String) {
        let cleaned = hex.trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        Scanner(string: cleaned).scanHexInt64(&rgb)

        let r = Double((rgb & 0xFF0000) >> 16) / 255
        let g = Double((rgb & 0x00FF00) >> 8) / 255
        let b = Double(rgb & 0x0000FF) / 255

        self.init(red: r, green: g, blue: b)
    }
}

/// Curated accent palette offered when creating a habit — kept small and
/// cohesive rather than a full color picker.
enum HabitPalette {
    static let options: [String] = [
        "5B8DEF", // blue
        "6FCF97", // green
        "F2994A", // orange
        "EB5757", // red
        "9B51E0", // purple
        "F2C94C"  // yellow
    ]
}

// MARK: - Model

@Model
final class Habit {
    var name: String
    var iconName: String
    var colorHex: String
    var createdAt: Date
    /// One Date per day the habit was completed (normalized to start of day).
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

// MARK: - ViewModel

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
            print("HabitFlow save error: \(error)")
        }
    }
}

// MARK: - HabitRowView

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

// MARK: - EmptyStateView

struct EmptyStateView: View {
    let onAddTapped: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "sparkles")
                .font(.system(size: 44))
                .foregroundStyle(.secondary)

            Text("No habits yet")
                .font(.system(.title3, design: .rounded, weight: .semibold))

            Text("Start with one small habit you want to build.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)

            Button(action: onAddTapped) {
                Label("Add Habit", systemImage: "plus")
                    .font(.system(.subheadline, design: .rounded, weight: .semibold))
                    .padding(.horizontal, 18)
                    .padding(.vertical, 10)
                    .background(Color.accentColor, in: Capsule())
                    .foregroundStyle(.white)
            }
            .buttonStyle(.plain)
            .padding(.top, 4)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

// MARK: - AddHabitView

struct AddHabitView: View {
    @Environment(\.dismiss) private var dismiss
    let onSave: (_ name: String, _ icon: String, _ colorHex: String) -> Void

    @State private var name: String = ""
    @State private var selectedIcon: String = Self.icons.first!
    @State private var selectedColorHex: String = HabitPalette.options.first!
    @FocusState private var nameFieldFocused: Bool

    private static let icons = [
        "checkmark.circle.fill", "drop.fill", "figure.walk", "book.fill",
        "moon.fill", "leaf.fill", "dumbbell.fill", "pencil",
        "cup.and.saucer.fill", "heart.fill", "sun.max.fill", "bolt.fill"
    ]

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Habit name", text: $name)
                        .font(.system(.body, design: .rounded))
                        .focused($nameFieldFocused)
                } header: {
                    Text("Name")
                }

                Section {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 6), spacing: 12) {
                        ForEach(Self.icons, id: \.self) { icon in
                            IconChoice(
                                icon: icon,
                                isSelected: icon == selectedIcon,
                                accent: Color(hex: selectedColorHex)
                            ) {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                    selectedIcon = icon
                                }
                            }
                        }
                    }
                    .padding(.vertical, 4)
                } header: {
                    Text("Icon")
                }

                Section {
                    HStack(spacing: 14) {
                        ForEach(HabitPalette.options, id: \.self) { hex in
                            ColorChoice(hex: hex, isSelected: hex == selectedColorHex) {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                    selectedColorHex = hex
                                }
                            }
                        }
                    }
                    .padding(.vertical, 4)
                } header: {
                    Text("Color")
                }
            }
            .navigationTitle("New Habit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        onSave(name, selectedIcon, selectedColorHex)
                        dismiss()
                    }
                    .fontWeight(.semibold)
                    .disabled(name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
            }
            .onAppear { nameFieldFocused = true }
        }
    }
}

private struct IconChoice: View {
    let icon: String
    let isSelected: Bool
    let accent: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
                .font(.system(size: 17, weight: .semibold))
                .foregroundStyle(isSelected ? .white : .primary)
                .frame(width: 40, height: 40)
                .background(isSelected ? accent : Color.primary.opacity(0.06), in: Circle())
        }
        .buttonStyle(.plain)
    }
}

private struct ColorChoice: View {
    let hex: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Circle()
                .fill(Color(hex: hex))
                .frame(width: 30, height: 30)
                .overlay(
                    Circle()
                        .strokeBorder(.white, lineWidth: isSelected ? 3 : 0)
                )
                .overlay(
                    Circle()
                        .strokeBorder(Color(hex: hex), lineWidth: isSelected ? 2 : 0)
                        .padding(-3)
                )
        }
        .buttonStyle(.plain)
    }
}

// MARK: - HabitDetailView

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

// MARK: - ContentView

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Habit.createdAt, order: .reverse) private var habits: [Habit]

    @State private var showAddSheet = false
    private var viewModel: HabitListViewModel { HabitListViewModel(modelContext: modelContext) }

    var body: some View {
        NavigationStack {
            Group {
                if habits.isEmpty {
                    EmptyStateView(onAddTapped: { showAddSheet = true })
                } else {
                    ScrollView {
                        VStack(spacing: 12) {
                            ForEach(habits) { habit in
                                NavigationLink {
                                    HabitDetailView(
                                        habit: habit,
                                        onToggle: { viewModel.toggleCompletion(for: habit) },
                                        onDelete: { viewModel.delete(habit) }
                                    )
                                } label: {
                                    HabitRowView(habit: habit) {
                                        viewModel.toggleCompletion(for: habit)
                                    }
                                }
                                .buttonStyle(.plain)
                                .transition(.asymmetric(
                                    insertion: .scale.combined(with: .opacity),
                                    removal: .opacity
                                ))
                            }
                        }
                        .padding(16)
                        .animation(.spring(response: 0.4, dampingFraction: 0.75), value: habits.count)
                    }
                }
            }
            .navigationTitle("HabitFlow")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAddSheet = true
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 22))
                    }
                }
            }
            .sheet(isPresented: $showAddSheet) {
                AddHabitView { name, icon, colorHex in
                    viewModel.addHabit(name: name, iconName: icon, colorHex: colorHex)
                }
                .presentationDetents([.large])
            }
        }
    }
}

// MARK: - App Entry Point

@main
struct HabitFlowApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Habit.self)
    }
}
