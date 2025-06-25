import SwiftUI

struct StartView: View {
    @EnvironmentObject private var viewModel : MemoryGameViewModel
    var body: some View {
        ZStack{
            if viewModel.isGameStart{
                ContentView()
                    .transition(.opacity)
            }else{
                VStack{
                    Button {
                        withAnimation{
                            viewModel.isGameStart = true
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
            }
        }
        
        
        
    }
}

