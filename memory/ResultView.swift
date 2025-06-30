import SwiftUI

struct ResultView: View {
    @EnvironmentObject private var viewModel : MemoryGameViewModel
    var body: some View {
        VStack{
            Text("結果画面")
            Button{
                viewModel.reset()
                viewModel.gameState = .playing
            } label : {
                Text("リセット")
            }
            Button{
                viewModel.reset()
                viewModel.gameState = .home
            } label : {
                Text("スタート画面に")
            }
        }
    }
}

#Preview {
    ResultView()
}
