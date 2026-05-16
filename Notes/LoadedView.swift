import SwiftUI


struct LoadedView: View {
    @State private var title = ""
    @State private var text = ""
    var state: AppState
    var note: String
    var onSave: () -> Void = {}
    
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Title", text: $title)
                    .font(.title)
                Divider()
                TextEditor(text: $text)
            }
            .onAppear {
                title = note
                text = loadNote(fileName: note)
            }
            .onDisappear {
                guard !title.isEmpty else { return }
                state.currentNote = title
                state.data = text
                saveNote(state: state)
                onSave()
            }
        }
    }
}

#Preview {
    LoadedView(state: AppState(), note: "")
}
