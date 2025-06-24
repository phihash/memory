import Foundation

class MemoryGameViewModel : ObservableObject {
    @Published var cards : [Card] = []

    init(){
        startGame()
    }

    func startGame(){
        print("ゲームを開始しました")
    }

}
