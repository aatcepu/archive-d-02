//
//  ContentView.swift
//  HabitFlow
//
//  Root screen: list of habits, sorted with the most recently created first.
//  Presents AddHabitView as a sheet and HabitDetailView via NavigationStack.
//

import SwiftUI
import SwiftData

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

#Preview {
    ContentView()
        .modelContainer(for: Habit.self, inMemory: true)
}
