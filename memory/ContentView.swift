import SwiftUI

struct ContentView: View {
    @State private var viewModel = MemoryGameViewModel()
    var body: some View {
        ScrollView{
            VStack {
                ForEach(viewModel.cards){ card in
                    Image(card.fileName)
                        .resizable()
                        .scaledToFit()
                        .onTapGesture {
                            print("\(card.fileName)がタップされました")
                        }
                }
            }
        }
    }
}

