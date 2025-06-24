import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MemoryGameViewModel()
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    var body: some View {
        ScrollView{
            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(viewModel.cards){ card in
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(card.isFace ? Color.white : Color.blue)
                            .frame(height:100)
                            .shadow(radius: 1)

                        if card.isMatch || card.isFace {
                            //マッチしてる　あるいは　表
                            Image(card.fileName)
                                .resizable()
                                .scaledToFit()
                                .padding()
                        } else{
                            Image("top")
                                .resizable()
                                .scaledToFit()
                        }
                    }
                    .onTapGesture {
                        Task{
                            await viewModel.choose(card:card)
                        }
                    }
                    .animation(.easeInOut, value: card.isFace)
                }
            }
            .padding(8)
        }
    }
}

