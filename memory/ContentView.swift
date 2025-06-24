import SwiftUI

struct ContentView: View {
    @State private var viewModel = MemoryGameViewModel()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
    }
}

