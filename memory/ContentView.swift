import SwiftUI

struct ContentView: View {
    @State private var viewModel = MemoryGameViewModel()
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(viewModel.cards){ card in
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue)
                            .frame(height:100)

                        Image(card.fileName)
                            .resizable()
                            .scaledToFit()
                            .padding()
                    }
                    .onTapGesture {
                            print("\(card.fileName)がタップされました")
                    }
                }
            }
            .padding(8)
        }
    }
}

