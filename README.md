# Notes App

Simple notes application built with SwiftUI and `NavigationStack`.

## Features

- 📋 Display all saved notes
- ➕ Create new notes
- 📖 Open and read notes
- 💾 Auto refresh notes list after saving
- 🧭 Navigation using `NavigationStack`
- 📝 Preview first line of note content inside the list


---

# Technologies

- Swift
- SwiftUI
- NavigationStack
- List
- State Management (`@State`)

---

# Project Structure

## `ContentView.swift`

Main screen of the application.

Contains:

- Notes list
- Navigation to note editor
- Button for creating notes
- Automatic notes refresh

---

# How It Works

## Load Notes

```swift
@State private var listNotes = getAllNotes()
```

Loads all saved notes into the app state.

---

## Display Notes

```swift
ForEach(listNotes, id: \.self)
```

Iterates through every note and displays it inside a `List`.

---

## Open Existing Note

```swift
NavigationLink(destination: LoadedView(...))
```

Opens selected note screen.

---

## Create New Note

```swift
.navigationDestination(isPresented: $newView)
```

Presents `NewView` when the user taps the `+` button.

---

## Refresh Notes

```swift
.onAppear {
    listNotes = getAllNotes()
}
```

Reloads all notes when the view appears.

---

# Example UI

- Notes list
- Gray subtitle preview
- Plus button in navigation bar
- Native iOS/macOS design

---

# Requirements

- Xcode 15+
- iOS 16+ / macOS 13+
- Swift 5.9+


---

# Author

anticlown aka ITZLORD3R
