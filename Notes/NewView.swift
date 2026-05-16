import Foundation
import SwiftUI

struct NewView: View {
    
    @State private var title = ""
    @State private var text = ""
    var state: AppState
    var onSave: () -> Void = {}
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Title", text: $title)
                    .font(.title)
                Divider()
                TextEditor(text: $text)
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
    NewView(state: AppState())
}
