import SwiftUI

@main
struct memoryApp: App {
    @StateObject private var viewModel = MemoryGameViewModel()
    var body: some Scene {
        WindowGroup {
            StartView()
                .environmentObject(viewModel)
        }
    }
}
