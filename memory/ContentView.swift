import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var viewModel : MemoryGameViewModel
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(viewModel.cards){ card in
                        ZStack{
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
}

