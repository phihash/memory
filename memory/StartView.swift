import SwiftUI

struct StartView: View {
    @EnvironmentObject private var viewModel : MemoryGameViewModel
    var body: some View {
        VStack{
            Button {
                withAnimation{
                    viewModel.gameState = .playing
                }
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.red)
                        .frame(height:60)
                    Text("ゲームスタート")
                        .fontWeight(.bold)
                        .font(.title2)
                }
                .padding()
            }
            Button {
                print("図鑑ボタンタップ")
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.red)
                        .frame(height:60)
                    Text("図鑑へ")
                        .fontWeight(.bold)
                        .font(.title2)
                }
                .padding()
            }
        }
        .background(Image("back"))
    }
}

