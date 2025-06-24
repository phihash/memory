import SwiftUI

struct StartView: View {
    @State private var isGameStart : Bool = false
    var body: some View {
        ZStack{
            if isGameStart{
                ContentView()
                    .transition(.opacity)
            }else{
                VStack{
                    Button {
                        withAnimation{
                            isGameStart = true
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

#Preview {
    StartView()
}
