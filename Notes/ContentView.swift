import SwiftUI



struct ContentView: View {
    @State var state = AppState()
    @State private var newView = false
    @State private var listNotes = getAllNotes()
    
    
    
    var body: some View {
        NavigationStack {
            VStack {
                
                List {
                    ForEach(listNotes, id: \.self) { note in
                        NavigationLink(destination: LoadedView(state: state, note: note, onSave: {
                            listNotes = getAllNotes()
                        })) {
                            VStack(alignment: .leading) {
                                Text(note)
                                    .lineLimit(1)
                                Text(loadNote(fileName: note))
                                    .lineLimit(1)
                                    .foregroundStyle(.gray)
                                    .font(.subheadline)
                            }
                        }
                    }
                }
                
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        newView.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                }
                
                
                
                
            }
            .navigationTitle("Notes")
            .navigationDestination(isPresented: $newView) {
                NewView(state: state) {
                    listNotes = getAllNotes()
                }
            }
            .onAppear {
                listNotes = getAllNotes()
            }
            .onChange(of: newView) {
                if !newView {
                    listNotes = getAllNotes()
                }
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
