//
//  AddHabitView.swift
//  HabitFlow
//
//  Sheet for creating a new habit: name, icon, and accent color.
//  Kept intentionally simple — one screen, no unnecessary steps.
//

import SwiftUI

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

#Preview {
    AddHabitView(onSave: { _, _, _ in })
}
