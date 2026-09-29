# HabitFlow

A small, minimalist habit tracker built with SwiftUI + SwiftData.

## Core feature

Track daily habits with one tap. See your current streak, a 7-day mini
history on the list, and a 28-day grid + total-days stat on the detail
screen. That's it — one feature, done well.

## Screens (4)

1. **ContentView** — list of all habits (or an empty state before you add one)
2. **AddHabitView** — sheet to create a habit (name, icon, accent color)
3. **HabitDetailView** — streak stats, 28-day completion grid, delete
4. **EmptyStateView** — friendly first-run placeholder (counts as the 4th "screen")

## Architecture (MVVM)

```
HabitFlow/
├── HabitFlowApp.swift              # App entry point, SwiftData container
├── Models/
│   └── Habit.swift                 # @Model — persisted habit + derived streak logic
├── ViewModels/
│   └── HabitListViewModel.swift    # Add / toggle / delete + haptics, talks to ModelContext
├── Views/
│   ├── ContentView.swift           # Root list screen
│   ├── HabitRowView.swift          # List row: icon, streak, week dots, complete button
│   ├── AddHabitView.swift          # Create-habit sheet
│   ├── HabitDetailView.swift       # Drill-in detail + delete
│   └── EmptyStateView.swift        # Pre-first-habit placeholder
└── Extensions/
    └── Color+Hex.swift             # Hex → Color, curated accent palette
```

- **Model** (`Habit`) owns its own derived state (`currentStreak`,
  `isCompletedToday`, `lastSevenDays()`) so views stay dumb.
- **ViewModel** (`HabitListViewModel`) is the only thing that touches
  `ModelContext` — saves, deletes, and fires haptic feedback.
- **Views** are pure SwiftUI, driven by `@Query` (live SwiftData feed) and
  callbacks passed down from `ContentView`.

## Persistence

Uses **SwiftData** (`@Model`, `@Query`, `ModelContainer`) — the natural
choice here since a habit is a small structured record with an array of
dates, not just a flat key-value pair.

## Design details

- System font with `.rounded` design throughout for a friendly, premium feel
- Light/dark mode handled automatically via semantic colors (`.primary`,
  `.secondary`, `.thinMaterial`) — no hardcoded colors except the 6-color
  accent palette, which is readable in both modes
- Spring animations on completion toggle, habit creation, and icon/color
  selection
- Haptic feedback: success notification on habit creation, impact feedback
  on completion toggle

## Running it

1. Open Xcode 15+ (SwiftData requires iOS 17+ / Xcode 15+)
2. **File → New → Project → iOS → App**
   - Product Name: `HabitFlow`
   - Interface: SwiftUI
   - Storage: SwiftData (or None — files below add it manually)
3. Delete the default `ContentView.swift` and `Item.swift` Xcode generates
4. Drag in the `HabitFlow/` folder structure from this project (Models,
   ViewModels, Views, Extensions, and `HabitFlowApp.swift`), making sure
   "Copy items if needed" is checked
5. Build & run on iOS 17+ simulator or device (⌘R)

No external dependencies — everything here is native SwiftUI + SwiftData.
