import SwiftUI

struct ResultView: View {
    @EnvironmentObject private var viewModel : MemoryGameViewModel
    var body: some View {
        VStack{
            Text("結果画面")
            Button{
                viewModel.reset()
            } label : {
                Text("リセット")
            }
        }
    }
}

#Preview {
    ResultView()
}
