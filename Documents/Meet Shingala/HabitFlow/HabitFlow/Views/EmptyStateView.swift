//
//  EmptyStateView.swift
//  HabitFlow
//
//  Friendly placeholder shown before the user adds their first habit.
//

import SwiftUI

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

#Preview {
    EmptyStateView(onAddTapped: {})
}
